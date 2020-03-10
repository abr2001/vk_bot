class SaveTotalPhrases < ActiveRecord::Migration[5.1]
  def up
    TotalPhrase.create(value: 'Ну кто бы мог подумать ...', part: :header)
    TotalPhrase.create(value: 'Вот читаю я всё это и задумался.', part: :header)
    TotalPhrase.create(value: 'Коллеги, товарищи, соотечественники и просто хорошие люди, послушайте. ', part: :header)
    TotalPhrase.create(value: 'Всем привет!!!', part: :header)
    TotalPhrase.create(value: 'Доброго времени суток ', part: :header)
    TotalPhrase.create(value: 'Всё только начинается. ', part: :header)
    TotalPhrase.create(value: 'Я вот, что подумал ', part: :header)
    TotalPhrase.create(value: 'Хочется присоединится к вашей беседе.', part: :header)
    TotalPhrase.create(value: 'Хочу сказать, вот, что', part: :header)
    TotalPhrase.create(value: 'Не могу больше молчать.', part: :header)
    TotalPhrase.create(value: 'Чтобы это всё значило?', part: :header)
    TotalPhrase.create(value: 'Смотрю я в окно и думаю о том, что:', part: :header)
    TotalPhrase.create(value: 'Здраствуйте', part: :header)
    TotalPhrase.create(value: 'Привет всем, кто в беседе.', part: :header)
    TotalPhrase.create(value: 'Я выскажусь по теме:', part: :header)

    TotalPhrase.create(value: 'Возможно, кто-то со мной не согласится', part: :footer)
    TotalPhrase.create(value: 'Возможно, кто-то со мной согласится', part: :footer)
    TotalPhrase.create(value: 'Я всё сказал', part: :footer)
    TotalPhrase.create(value: 'Что думаете по этому поводу?', part: :footer)
    TotalPhrase.create(value: 'Есть чем возразить?', part: :footer)
    TotalPhrase.create(value: 'Я закончил', part: :footer)
    TotalPhrase.create(value: 'Думайте, товарищи, думайте!', part: :footer)
    TotalPhrase.create(value: 'Всё!', part: :footer)
    TotalPhrase.create(value: 'Всё! Пойду пить кофе.', part: :footer)
    TotalPhrase.create(value: 'Всё! Пойду пить чай.', part: :footer)
    TotalPhrase.create(value: 'Всё! Пойду выпью что-нибудь.', part: :footer)
    TotalPhrase.create(value: 'Всё! Этого достаточно.', part: :footer)
    TotalPhrase.create(value: 'Вот оно так чаще всего и бывает.', part: :footer)
    TotalPhrase.create(value: 'Пока, пока ...', part: :footer)
    TotalPhrase.create(value: 'Будьте здоровы, живите богато, но дружно', part: :footer)
    TotalPhrase.create(value: 'До свидания', part: :footer)
    TotalPhrase.create(value: 'До свидания ... мой любимый город :)', part: :footer)
    TotalPhrase.create(value: 'Вот и делайте выводы.', part: :footer)
    TotalPhrase.create(value: 'И что дальше будете делать?', part: :footer)
    TotalPhrase.create(value: 'И что дальше будем делать?', part: :footer)
  end

  def down
    TotalPhrase.delete_all
  end
end
