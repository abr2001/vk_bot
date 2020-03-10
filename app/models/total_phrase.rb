# frozen_string_literal: true

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

class TotalPhrase < ApplicationRecord
  include Utf8

  PARTS = {
    header: 'Приветсвие',
    footer: 'Заключение'
  }.freeze

  scope :headers, -> { where(part: :header).order(:value) }
  scope :footers, -> { where(part: :footer).order(:value) }

  def self.random_footer
    TotalPhrase.footers.offset(rand(TotalPhrase.footers.count)).first.value
  end

  def self.random_header
    TotalPhrase.headers.offset(rand(TotalPhrase.headers.count)).first.value
  end
end
