# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  body          :text(65535)
#  post_group_id :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Post < ApplicationRecord
  include Utf8

  belongs_to :post_group
  has_many :last_posts, dependent: :destroy
end
