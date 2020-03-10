# frozen_string_literal: true

class Vkontakte::Comments::AccountService < Vkontakte::Comments::BaseService
  attr_reader :commenter_type

  def initialize(commenter_type)
    @commenter_type = commenter_type
  end

  def set_current_account
    exist_running_commentators? ? set_next_account : set_first_account!
  end

  private

  def current_account
    @current_account ||= female_commenters? ? female_account_for_comment : account_for_comment
  end

  def female_commenters?
    commenter_type.eql?(:female_commenters)
  end

  def exist_running_commentators?
    check_double_running
    commenters.runnings.exists?
  end

  def set_first_account!
    account = commenters.first
    account.run
    account.save
  end

  def set_next_account
    return if commenters.count.eql?(1)

    Account.transaction do
      current_account_sleep!
      next_account.present? ? next_account_run! : set_first_account!
    end
  end

  def next_account_run!
    next_account.run
    next_account.save
  end

  def current_account_sleep!
    current_account.sleep
    current_account.save
  end

  def next_account
    @next_account ||= commenters.where('id > ?', current_account.id).first
  end

  def check_double_running
    return if commenters.runnings.count < 2

    commenters.runnings.update(comment: 'sleeping')
  end

  def commenters
    @commenters ||= Account.send(commenter_type)
  end
end
