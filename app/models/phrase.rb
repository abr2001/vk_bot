# frozen_string_literal: true

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

class Phrase < ApplicationRecord
  include Utf8

  belongs_to :keyphrase
  validates :value, presence: true

  after_create { update(sort: id) }

  def self.random
    Phrase.offset(rand(Phrase.count)).first
  end
end
