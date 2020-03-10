# frozen_string_literal: true

module Utf8
  extend ActiveSupport::Concern

  included do
    before_save :to_utf8
  end

  private

  def to_utf8
    %i[value body name].each do |attr|
      send(attr).gsub!(/[\u{10000}-\u{FFFFF}]/, '') if methods.include?(attr)
    end
  end
end
