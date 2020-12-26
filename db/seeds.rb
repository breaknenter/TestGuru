# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: "Sergey", email: "net@net.ru")

category = Category.create(title: "Слова")

test = Test.create(title: "Словарный запас", level: 0, category_id: category.id, author_id: user.id)

question = Question.create(text: "Коллизия", test_id: test.id)

Answer.create(text: "Проблема", correct: false, question_id: question.id)
Answer.create(text: "Искажение", correct: false, question_id: question.id)
Answer.create(text: "Обман", correct: false, question_id: question.id)
Answer.create(text: "Противостояние", correct: true, question_id: question.id)

question = Question.create(text: "Меркантильный", test_id: test.id)

Answer.create(text: "Корыстный", correct: true, question_id: question.id)
Answer.create(text: "Безответственный", correct: false, question_id: question.id)
Answer.create(text: "Бездушный", correct: false, question_id: question.id)
Answer.create(text: "Экономный", correct: false, question_id: question.id)

question = Question.create(text: "Претенциозный", test_id: test.id)

Answer.create(text: "Амбициозный", correct: true, question_id: question.id)
Answer.create(text: "Своенравный", correct: false, question_id: question.id)
Answer.create(text: "Наглый", correct: false, question_id: question.id)
Answer.create(text: "Вычурный", correct: false, question_id: question.id)

question = Question.create(text: "Невежа", test_id: test.id)

Answer.create(text: "Обманщик", correct: false, question_id: question.id)
Answer.create(text: "Задира", correct: false, question_id: question.id)
Answer.create(text: "Грубиян", correct: false, question_id: question.id)
Answer.create(text: "Неуч", correct: true, question_id: question.id)

question = Question.create(text: "Нонсенс", test_id: test.id)

Answer.create(text: "Премьера", correct: false, question_id: question.id)
Answer.create(text: "Новинка", correct: false, question_id: question.id)
Answer.create(text: "Бессмыслица", correct: false, question_id: question.id)
Answer.create(text: "Сенсация", correct: true, question_id: question.id)

question = Question.create(text: "Конъюктура", test_id: test.id)

Answer.create(text: "Обстановка", correct: true, question_id: question.id)
Answer.create(text: "Обстоятельство", correct: false, question_id: question.id)
Answer.create(text: "Акупунктура", correct: false, question_id: question.id)
Answer.create(text: "Чиновничество", correct: false, question_id: question.id)

question = Question.create(text: "Гипотеза", test_id: test.id)

Answer.create(text: "Предположение", correct: true, question_id: question.id)
Answer.create(text: "Теория", correct: false, question_id: question.id)
Answer.create(text: "Постулат", correct: false, question_id: question.id)
Answer.create(text: "Аксиома", correct: false, question_id: question.id)

question = Question.create(text: "Тривиальный", test_id: test.id)

Answer.create(text: "Банальный", correct: true, question_id: question.id)
Answer.create(text: "Запутанный", correct: false, question_id: question.id)
Answer.create(text: "Незаурядный", correct: false, question_id: question.id)
Answer.create(text: "Бессмысленный", correct: false, question_id: question.id)
