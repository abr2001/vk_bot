# == Schema Information
#
# Table name: comment_accounts
#
#  id         :bigint           not null, primary key
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe CommentAccount, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
