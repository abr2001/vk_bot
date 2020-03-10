# frozen_string_literal: true

class PhraseService < BaseService
  def up
    previous_phrase = phrases.where('sort < ?', sort).last
    return if previous_phrase.blank?

    Phrase.transaction do
      phrase.update(sort: previous_phrase.sort)
      previous_phrase.update(sort: sort)
    end
  end

  def down
    next_phrase = phrases.where('sort > ?', sort).first
    return if next_phrase.blank?

    Phrase.transaction do
      phrase.update(sort: next_phrase.sort)
      next_phrase.update(sort: sort)
    end
  end

  private

  def sort
    @sort ||= phrase.sort
  end

  def phrase
    @phrase ||= Phrase.find(id)
  end

  def phrases
    @phrases ||= phrase.keyphrase.phrases.order(:sort)
  end
end
