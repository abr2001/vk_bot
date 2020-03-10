# frozen_string_literal: true

class ClearTilesJob < ApplicationJob
  def perform(account_id)
    account = Account.find_by(id: account_id)
    return if account.blank?

    account.tails.not_sended.delete_all
  rescue StandardError => e
    create_logger(e)
  end
end
