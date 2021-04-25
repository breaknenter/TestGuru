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

dicts = Category.create(title: "Словари")

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
