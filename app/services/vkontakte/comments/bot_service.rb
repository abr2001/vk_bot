# frozen_string_literal: true

class Vkontakte::Comments::BotService < Vkontakte::Comments::BaseService
  MAX_DIRECT_COMMENTS = 1

  def run
    return if comments_response.error.present?

    return do_female_comment if post_without_comments?

    return do_comment if do_comment?

    do_comments
  end

  private

  def do_comment?
    post_has_only_bot_comments? && can_direct_comments?
  end

  def message_text(comment)
    Keyphrase.find_each do |keyphrase|
      keyphrase.variants.each do |key|
        next unless comment_contains_keyphrase_variant?(key, comment)

        return generate_message_text(comment, keyphrase.next_phrase)
      end
    end
    nil
  end

  def do_comments
    post_comments.each do |comment|
      next if own_comment_of_account?(comment)

      next unless can_comment?(comment)

      do_comment(comment, message_text(comment))
    end
  end

  def do_comment(comment = nil, text = nil)
    Vkontakte::Comments::CreateService.new(
      post_id: post.id,
      owner_id: owner_id,
      comment: comment,
      text: text,
      commenter_type: :commenters
    ).create
  end

  def do_female_comment
    Vkontakte::Comments::CreateService.new(
      post_id: post.id,
      owner_id: owner_id,
      comment: nil,
      text: potir,
      commenter_type: :female_commenters
    ).create
  end

  def potir
    PotirService.new.random_praise
  end

  def can_direct_comments?
    CommentLog.where(commented_id: nil, post_id: post.id).count < MAX_DIRECT_COMMENTS
  end

  def post_has_only_bot_comments?
    post_comments.size == own_comment_count
  end

  def post_comments
    @post_comments ||= comments_response.response.items
  end

  def own_comment_count
    @own_comment_count ||= CommentLog.where(post_id: post.id).count
  end

  def post_without_comments?
    post.comments[:count].zero?
  end

  def own_comment_of_account?(comment)
    accounts.include?(comment.from_id.to_s)
  end

  def comments_by_others_count
    @comments_by_others_count ||= post_comments.size - own_comment_count
  end

  def can_comment?(comment)
    CommentLog.where(commented_id: comment.id, post_id: post.id).count < MAX_DIRECT_COMMENTS
  end

  def accounts
    @accounts ||= Account.commenters.pluck(:code)
  end

  def comment_contains_keyphrase_variant?(key, comment)
    comment.text.present? &&
      comment.text.downcase.include?(key.strip.downcase)
  end

  def generate_message_text(comment, phrase)
    sleep timeout
    user_response = api_get('users.get', account_for_comment, user_ids: comment.from_id)

    return if user_response.error.present?

    phrase.update(used_at: DateTime.current)

    [user_response.response[0]&.first_name, uniq_phrase(phrase)].join(', ')
  end
end
