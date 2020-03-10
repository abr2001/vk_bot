# == Schema Information
#
# Table name: keyphrases
#
#  id         :bigint           not null, primary key
#  value      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :keyphrase do
    value "MyString"
  end
end
