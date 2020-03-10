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

require 'rails_helper'

RSpec.describe CommentPost, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
