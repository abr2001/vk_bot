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

require 'rails_helper'

RSpec.describe CommentLog, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
