# frozen_string_literal: true

# == Schema Information
#
# Table name: comment_posts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  owner_id   :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CommentPost < ApplicationRecord
  belongs_to :user

  def link
    "https://vk.com/wall#{owner_id}_#{post_id}"
  end
end
