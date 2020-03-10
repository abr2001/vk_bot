# frozen_string_literal: true

# == Schema Information
#
# Table name: comment_accounts
#
#  id         :bigint           not null, primary key
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CommentAccount < ApplicationRecord
  validates :owner_id, uniqueness: true
  validates :owner_id, presence: true
end
