# frozen_string_literal: true

class DeleteAccountJob < ApplicationJob
  def perform(account_id)
    return unless Account.where(id: account_id).exists?

    account = Account.find(account_id)

    Account.transaction do
      account.tails.delete_all
      account.comment_logs.delete_all
      account.api_vk_error_logs.delete_all
      account.delete
    end
  rescue StandardError => e
    create_logger(e)
  end
end
