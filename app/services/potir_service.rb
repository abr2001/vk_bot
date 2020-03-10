# frozen_string_literal: true

class PotirService < BaseService
  PRAISE_ID = 55
  # rubocop:disable Metrics/LineLength: Line is too long
  EMOJI = %w[😻 😍 😘 🤗 💋 😚 🙏 ⭐️ ☀️ ✨ 🌟 💐 🌷 🌹 🥀 🌺 🌸 🌼 🌻 🌞 🏆 🥇 🎗 🎯 🌠 🎇 🎆 🎀 💌 📌 👍 👏 ❤️ 💛 💚 💙 💜 ❣️ 💕 💞 💓 💗 💖 💝 💟 🔴 ➕].freeze
  # rubocop:enable Metrics/LineLength: Line is too long

  def random_praise
    "#{praise_first_part.name}#{emojis}#{separator}#{praise_second_part.name}#{emojis}"
  end

  private

  def praise_parts
    @praise_parts ||= Potir.find(PRAISE_ID).children
  end

  def separator
    line_feed = "\n" * rnd
    line_feed.size.zero? ? spacebars : line_feed
  end

  def rnd
    rand(3)
  end

  def spacebars
    ' ' * rnd
  end

  %w[first second].each do |method|
    define_method "praise_#{method}_parts" do
      praise_parts
        .send(method)
        .children
    end

    define_method "praise_#{method}_part" do
      send("praise_#{method}_parts")
        .offset(rand(send("praise_#{method}_parts").count))
        .first
    end
  end

  def emoji
    EMOJI[rand(EMOJI.size)]
  end

  def emojis
    max = rnd
    return if max.zero?

    (1..max).map { emoji }.join
  end
end
