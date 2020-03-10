# frozen_string_literal: true

# == Schema Information
#
# Table name: tails
#
#  id               :bigint           not null, primary key
#  friend_id        :integer
#  status           :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  response         :text(65535)
#  account_id       :bigint
#  error_code       :string(255)
#  captcha_sid      :string(255)
#  captcha_img      :string(255)
#  resolved_captcha :boolean          default(FALSE)
#

class Tail < ApplicationRecord
  CAPTCHA_ERROR = '14'

  belongs_to :account

  scope :sended, -> { where.not(status: nil) }
  scope :not_sended, -> { where(status: nil) }
  scope :with_captcha, -> { where(error_code: CAPTCHA_ERROR) }
  scope :not_resolved_captcha, -> { where(error_code: CAPTCHA_ERROR, resolved_captcha: false) }

  def self.captcha
    not_resolved_captcha.last
  end
end
