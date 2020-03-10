# frozen_string_literal: true

class Vkontakte::Comments::DirectPostService < Vkontakte::Comments::BaseService
  def create_comment_for_post
    return
    # надо переделать см. Vkontakte::Comments::BotService

    Vkontakte::Comments::AccountService.new.set_current_account

    comments_response = get_comments(owner_id, post.id)

    Keyphrase.find_each do |keyphrase|
      Vkontakte::Comments::BotService.new(post_id: post_id,
                                   owner_id: owner_id,
                                   keyphrase: keyphrase,
                                   comments_response: comments_response).run
    end
  end
end
