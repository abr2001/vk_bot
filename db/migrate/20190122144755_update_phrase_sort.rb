class UpdatePhraseSort < ActiveRecord::Migration[5.1]
  def change
    now = DateTime.now
    Phrase.all.each { |p| p.update(sort: p.id, used_at: now) }
  end
end
