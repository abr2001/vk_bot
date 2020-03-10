# == Schema Information
#
# Table name: phrases
#
#  id           :bigint           not null, primary key
#  value        :text(65535)
#  keyphrase_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  used_at      :datetime
#  sort         :integer
#

require 'rails_helper'

RSpec.describe Phrase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
