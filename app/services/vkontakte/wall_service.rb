# frozen_string_literal: true

class Vkontakte::WallService < Vkontakte::ApiService
  def wall_post
    Account.find_each { |account| post(account) }
  end

  private

  def post_text(post)
    "#{post&.body} \n\n\n\n По материалам сайта http://russmoroz.ru"
  end

  def post(account)
    PostGroup.where(id: account.auto_post_groups).each do |post_group|
      next_post = PostService.new(account: account, post_group: post_group).next_post
      next if next_post.blank?

      api_post(
        'wall.post',
        account,
        owner_id: account.code,
        message: post_text(next_post)
      )
    end
  end
end
