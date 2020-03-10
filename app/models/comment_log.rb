# frozen_string_literal: true

# == Schema Information
#
# Table name: comment_logs
#
#  id           :bigint           not null, primary key
#  owner_id     :integer
#  post_id      :integer
#  account_id   :bigint
#  comment_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commented_id :integer
#

class CommentLog < ApplicationRecord
  belongs_to :account

  validates :owner_id, presence: true
  validates :post_id, presence: true
  validates :comment_id, presence: true
end
