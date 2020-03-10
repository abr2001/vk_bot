# frozen_string_literal: true

class Vkontakte::FriendsService < Vkontakte::ApiService
  LIMIT_OUTGOING_REQUESTS = 800

  def friends_to_tail
    items.in_groups_of(100) do |friend_ids|
      friend_ids = friend_ids.join(',')
      response = api_get('friends.areFriends', account, user_ids: friend_ids, need_sign: 0)
      add_tail(response)
    end
    Tail.count
  end

  def friends_get
    response = api_get('friends.get', account, user_id: params[:user_id])
    Vkontakte::FriendsService.new(items: response['response']['items'], account: account)
      .friends_to_tail
  end

  def friends_from_file
    file = params[:datafile].read
    items = file.split(/\s+/)
    Vkontakte::FriendsService.new(items: items, account: account).friends_to_tail
  end

  def users_get
    response = api_get('users.get', account, fields: 'photo_100')
    { response: response, success: response.error.nil? }
  end

  def add_friends
    User.find_each { |user| add_friends_to_user(user) }
  end

  def delete_friends
    User.find_each do |user|
      user.accounts.each do |account|
        delete_friend(account)
      end
    end
  rescue StandardError => e
    Rails.logger.info("delete_friends: #{e}")
  end

  private

  def add_friends_to_user(user)
    user.accounts.each do |account|
      tail = account.tails.not_sended.first
      next if tail.nil?

      response = api_get('friends.add', account, user_id: tail.friend_id, follow: 1)
      update_tail(tail, response)
    end
  end

  def update_tail(tail, response)
    Tail.transaction do
      tail.update(status: 'DONE', response: response)
      save_error(tail, response['error']) unless response['error'].nil?
    end
  end

  def add_tail(response)
    return if response['response'].nil?

    response['response'].each do |item|
      next if tail_exists?(item) || item['friend_status'].positive?

      Tail.create(friend_id: item['user_id'], account: account)
    end
  end

  def tail_exists?(item)
    account.tails.where(friend_id: item['user_id']).exists?
  end

  def delete_friend(account)
    response = friends_get_requests(1)
    return unless response['error'].nil?

    count = response['response']['count']
    return if count < LIMIT_OUTGOING_REQUESTS

    response = friends_get_requests(count - 1)
    return unless response['error'].nil?

    user_id = response['response']['items'][0]
    api_get('friends.delete', account, user_id: user_id)
  end

  # rubocop:disable Metrics/MethodLength
  def friends_get_requests(count)
    api_get(
      'friends.getRequests',
      account,
      offset: 1,
      count: count,
      extended: 0,
      need_mutual: 0,
      out: 1,
      need_viewed: 0,
      suggested: 0
    )
  end
  # rubocop:enable Metrics/MethodLength
end
