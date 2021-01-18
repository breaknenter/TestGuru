module QuestionsHelper
  def question_header(question)
    question.new_record? ? "Новый вопрос для теста #{question.test.title}" :
                           "Редактируем вопрос для теста #{question.test.title}"
  end
end
