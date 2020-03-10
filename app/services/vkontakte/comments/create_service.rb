# frozen_string_literal: true

class Vkontakte::Comments::CreateService < Vkontakte::Comments::BaseService
  def create
    Vkontakte::Comments::AccountService.new(commenter_type).set_current_account

    comment_response = create_comment(
      params: comment_params,
      account: account
    )

    comment_log(comment, comment_response) if comment_response.error.nil?
  end

  private

  def account
    commenter_type.eql?(:female_commenters) ? female_account_for_comment : account_for_comment
  end

  def comment_params
    {
      owner_id: owner_id,
      post_id: post_id,
      message: text.nil? ? uniq_phrase(Phrase.random) : text
    }.merge(comment.present? ? { reply_to_comment: comment.id } : {})
  end

  def create_comment(params:, account:)
    sleep 5
    response = api_post('wall.createComment', account, params)
    return response unless need_captcha?(response)

    captcha_key = Vkontakte::CaptchaService.new.captcha_key(response.error.captcha_img)
    return response if captcha_key.blank?

    api_post(
      'wall.createComment',
      account,
      params.merge(captcha_sid: response.error.captcha_sid, captcha_key: captcha_key)
    )
  end

  def comment_log(comment, comment_response)
    CommentLog.create(
      owner_id: owner_id,
      post_id: post_id,
      account: account_for_comment,
      comment_id: comment_response.response.comment_id,
      commented_id: comment&.id
    )
  end

  def post_not_available_for_comments?(response)
    response.error.present? && response.error.error_code == 213
  end
end
