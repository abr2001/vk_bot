# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#  info                   :text(65535)
#

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :accounts, dependent: :destroy

  SAFE_INFO_ACCESSORS = %i[encrypted_rucaptcha_key encrypted_rucaptcha_key_iv].freeze

  store :info, accessors: SAFE_INFO_ACCESSORS, coder: JSON

  attr_encrypted :rucaptcha_key, key: Base64.decode64(ENV['ENCRYPTED_RUCAPTCHA_KEY'])

  def admin?
    admin
  end
end
