# frozen_string_literal: true

class Vkontakte::Comments::BaseService < Vkontakte::ApiService
  VK_ID_ACCOUNT_FOR_COMMENT = %w[438401560 4048743 318680].freeze

  def run_bot
    Vkontakte::Comments::AccountService.new(:commenters).set_current_account

    CommentAccount.where(owner_id: VK_ID_ACCOUNT_FOR_COMMENT).each do |account|
      Vkontakte::Comments::FinderService.new(owner_id: account.owner_id).find_comments
    end
  end

  private

  def get_comments(owner_id, post_id)
    sleep timeout

    api_get(
      'wall.getComments',
      account_for_comment,
      owner_id: owner_id,
      post_id: post_id
    )
  end

  def account_for_comment
    Account.commenters.find_by(comment: 'running')
  end

  def female_account_for_comment
    Account.female_commenters.find_by(comment: 'running')
  end

  def timeout
    @timeout ||= 1
  end

  def uniq_phrase(phrase)
    "#{phrase.value}\n\n#{TotalPhrase.random_header}\n\n#{TotalPhrase.random_footer}"
  end
end
