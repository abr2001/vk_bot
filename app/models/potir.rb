# frozen_string_literal: true

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

class Potir < ApplicationRecord
  include Utf8

  belongs_to :parent,
             optional: true,
             foreign_key: :parent_id,
             class_name: name

  has_many :children,
           foreign_key: :parent_id,
           class_name: name

  validates :name, presence: true

  scope :top, -> { where parent_id: nil }
end
