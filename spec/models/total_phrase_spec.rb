# == Schema Information
#
# Table name: total_phrases
#
#  id         :bigint           not null, primary key
#  value      :text(65535)
#  part       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe TotalPhrase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
