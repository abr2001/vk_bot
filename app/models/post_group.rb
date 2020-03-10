# frozen_string_literal: true

# == Schema Information
#
# Table name: post_groups
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostGroup < ApplicationRecord
  include Utf8

  has_many :posts, dependent: :destroy
  has_many :last_posts, dependent: :destroy
end
