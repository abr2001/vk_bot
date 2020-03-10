# == Schema Information
#
# Table name: potirs
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Potir, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
