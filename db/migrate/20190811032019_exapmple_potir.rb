class ExapmplePotir < ActiveRecord::Migration[5.1]
  def change
    level_1 = Potir.create!(name: 'Согласие.')

    level_2 = Potir.create!(name: 'Первая часть.', parent: level_1)
    ['Да конечно.', 'Именно так.' 'Согласен.'].each do |name|
      Potir.create!(name: name, parent: level_2)
    end

    level_2 = Potir.create!(name: 'Вторая часть.', parent: level_1)
    ['Вы правы.', 'Правильно говорите.', 'Правота ваша.'].each do |name|
      Potir.create!(name: name, parent: level_2)
    end

    level_1 = Potir.create!(name: 'Несогласие.')

    level_2 = Potir.create!(name: 'Первая часть.', parent: level_1)
    ['Нет.', 'Конечно нет.' 'Нет, не так'].each do |name|
      Potir.create!(name: name, parent: level_2)
    end

    level_2 = Potir.create!(name: 'Вторая часть.', parent: level_1)
    ['Полная ерунда.', 'Чушь.', 'Фигня.'].each do |name|
      Potir.create!(name: name, parent: level_2)
    end
  end
end
