# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  token      :string(255)
#  user_id    :bigint
#  provider   :string(255)
#  code       :string(255)
#  comment    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  commenter  :boolean
#  proxy      :text(65535)
#  sex        :integer          default(0)
#

class Account < ApplicationRecord
  include AASM

  belongs_to :user
  has_many :tails, dependent: :destroy
  has_many :comment_logs, dependent: :destroy
  has_many :api_vk_error_logs
  has_many :last_posts

  validates :code, uniqueness: true

  enum sex: %i[male female]

  PROVIDER = {
    vk: 'ВКонтакте'
  }.freeze

  SAFE_PROXY_ACCESSORS = %i[
    proxy_ip
    proxy_user
    proxy_port
    proxy_password
    auto_post_groups
  ].freeze

  COMMENTER_USER_ID = 1

  store :proxy, accessors: SAFE_PROXY_ACCESSORS, coder: JSON

  scope :commenters, lambda {
    male
      .where(commenter: true, user_id: COMMENTER_USER_ID)
      .where.not(proxy: nil)
      .order(:id)
  }

  scope :female_commenters, lambda {
    female
      .where(commenter: true, user_id: COMMENTER_USER_ID)
      .order(:id)
  }

  scope :runnings, -> { where(comment: 'running') }

  aasm skip_validation_on_save: true, column: :comment do
    state :sleeping, initial: true
    state :running
    state :cleaning

    event :run do
      transitions from: :sleeping, to: :running
    end

    event :sleep do
      transitions from: :running, to: :sleeping
    end
  end
end
