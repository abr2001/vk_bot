# frozen_string_literal: true

class Vkontakte::Comments::FinderService < Vkontakte::Comments::BaseService
  COUNT_POSTS = 100
  MAX_OFFSET = 5

  def find_comments
    (0..MAX_OFFSET).each { |offset| find_posts(offset) }
  end

  private

  def find_posts(offset)
    posts(offset).each do |post|
      Vkontakte::Comments::BotService.new(post: post,
                                          owner_id: post.owner_id,
                                          comments_response: get_comments(owner_id, post.id)
                                          ).run
    end
  end

  def posts(offset)
    sleep timeout

    api_get(
      'wall.get',
      account_for_comment,
      owner_id: owner_id,
      count: COUNT_POSTS,
      offset: offset
    ).response&.items || {}
  end
end
