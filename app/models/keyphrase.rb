# frozen_string_literal: true

# == Schema Information
#
# Table name: keyphrases
#
#  id         :bigint           not null, primary key
#  value      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Keyphrase < ApplicationRecord
  has_many :phrases, dependent: :destroy
  validates :value, presence: true

  def next_phrase
    phrases.order(:used_at, :sort).limit(1).first
  end

  def variants
    value.split(';')
  end
end
