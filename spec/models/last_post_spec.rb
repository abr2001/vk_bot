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

require 'rails_helper'

RSpec.describe LastPost, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
