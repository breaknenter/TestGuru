# Накатываем: rails db:reset

admin = Admin.new(
  name:                  "admin",
  email:                 "testgururails@gmail.com",
  password:              Rails.application.credentials.admin_password!,
  password_confirmation: Rails.application.credentials.admin_password!,
  first_name:            "Joe",
  last_name:             "Shmoe"
  )

admin.skip_confirmation!
admin.save!

user = User.new(
  name:                  "noname",
  email:                 "noname@mail.to",
  password:              "qwertylove",
  password_confirmation: "qwertylove",
  first_name:            "No",
  last_name:             "Name"
  )

user.skip_confirmation!
user.save!

dicts = Category.create!(title: "Словари")

test = dicts.tests.create!(
  title:  "Словарный запас",
  level:  1,
  author: admin
  )

test.questions.create!(text: "Коллизия").answers.create!(
  [ { text: "Противостояние", correct: true  },
    { text: "Проблема",       correct: false },
    { text: "Искажение",      correct: false },
    { text: "Обман",          correct: false } ].shuffle!
  )

test.questions.create!(text: "Меркантильный").answers.create!(
  [ { text: "Корыстный",        correct: true  },
    { text: "Безответственный", correct: false },
    { text: "Бездушный",        correct: false },
    { text: "Экономный",        correct: false } ].shuffle!
  )

test.questions.create!(text: "Претенциозный").answers.create!(
  [ { text: "Амбициозный", correct: true  },
    { text: "Своенравный", correct: false },
    { text: "Наглый",      correct: false },
    { text: "Вычурный",    correct: false } ].shuffle!
  )

test.questions.create!(text: "Невежа").answers.create!(
  [ { text: "Неуч",     correct: true  },
    { text: "Обманщик", correct: false },
    { text: "Задира",   correct: false },
    { text: "Грубиян",  correct: false } ].shuffle!
  )

test.questions.create!(text: "Нонсенс").answers.create!(
  [ { text: "Сенсация",    correct: true  },
    { text: "Премьера",    correct: false },
    { text: "Новинка",     correct: false },
    { text: "Бессмыслица", correct: false } ].shuffle!
  )

test.questions.create!(text: "Конъюктура").answers.create!(
  [ { text: "Обстановка",     correct: true  },
    { text: "Обстоятельство", correct: false },
    { text: "Акупунктура",    correct: false },
    { text: "Чиновничество",  correct: false } ].shuffle!
  )

test.questions.create!(text: "Гипотеза").answers.create!(
  [ { text: "Предположение", correct: true  },
    { text: "Теория",        correct: false },
    { text: "Постулат",      correct: false },
    { text: "Аксиома",       correct: false } ].shuffle!
  )

test.questions.create!(text: "Тривиальный").answers.create!(
  [ { text: "Банальный",     correct: true  },
    { text: "Запутанный",    correct: false },
    { text: "Незаурядный",   correct: false },
    { text: "Бессмысленный", correct: false } ].shuffle!
  )

web_dev = Category.create(title: "Веб-разработка")

test = web_dev.tests.create!(
  title:  "HTML",
  level:  1,
  author: admin
  )

test.questions.create!(text: "Укажите тег позволяющий определить таблицу").answers.create!(
  [ { text: "<table>", correct: true  },
    { text: "<tab>",   correct: false },
    { text: "<tr>",    correct: false },
    { text: "<tabs>",  correct: false } ].shuffle!
  )

test.questions.create!(text: "Какой тег позволяет вставлять картинки в HTML документы?").answers.create!(
  [ { text: "<img>",     correct: true  },
    { text: "<pic>",     correct: false },
    { text: "<picture>", correct: false },
    { text: "<image>",   correct: false } ].shuffle!
  )

test.questions.create!(text: "Укажите тэг позволяющий создавать заголовки").answers.create!(
  [ { text: "<h2>",     correct: true  },
    { text: "<strong>", correct: false },
    { text: "<small>",  correct: false },
    { text: "<em>",     correct: false } ].shuffle!
  )

test.questions.create!(text: "Укажите тег позволяющий определить упорядоченный список").answers.create!(
  [ { text: "<ol>",   correct: true  },
    { text: "<li>",   correct: false },
    { text: "<ul>",   correct: false },
    { text: "<list>", correct: false } ].shuffle!
  )

test = web_dev.tests.create!(
  title:  "CSS",
  level:  1,
  author: admin
  )

test.questions.create!(text: "Вопрос 1").answers.create!(
  [ { text: "Верный", correct: true  },
    { text: "Ложный", correct: false },
    { text: "Ложный", correct: false },
    { text: "Ложный", correct: false } ]
  )

test.questions.create!(text: "Вопрос 2").answers.create!(
  [ { text: "Верный", correct: true  },
    { text: "Ложный", correct: false },
    { text: "Ложный", correct: false },
    { text: "Ложный", correct: false } ]
  )

test.questions.create!(text: "Вопрос 3").answers.create!(
  [ { text: "Верный", correct: true  },
    { text: "Ложный", correct: false },
    { text: "Ложный", correct: false },
    { text: "Ложный", correct: false } ]
  )

Badge.create!(name: "Прошёл тест с первой попытки",    reward: "first_time")
Badge.create!(name: "Прошёл все тесты 1 уровня",       reward: "all_level")
Badge.create!(name: "Прошёл категорию Веб-разработка", reward: "category")
