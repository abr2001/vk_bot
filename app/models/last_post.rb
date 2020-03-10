# frozen_string_literal: true

# == Schema Information
#
# Table name: last_posts
#
#  id            :bigint           not null, primary key
#  post_group_id :bigint
#  post_id       :bigint
#  account_id    :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class LastPost < ApplicationRecord
  belongs_to :post
  belongs_to :post_group
  belongs_to :account
end
