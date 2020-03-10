# frozen_string_literal: true

# == Schema Information
#
# Table name: api_vk_error_logs
#
#  id         :bigint           not null, primary key
#  method     :string(255)
#  response   :text(65535)
#  account_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  error_code :string(255)
#

class ApiVkErrorLog < ApplicationRecord
  belongs_to :account
end
