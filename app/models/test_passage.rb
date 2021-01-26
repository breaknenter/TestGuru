class TestPassage < ApplicationRecord
  WIN_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    self.current_question = next_question

    save!
  end

  def completed?
    !current_question
  end

  def success?
    calc_rate >= WIN_RATE ? true : false
  end

  def calc_rate
    ((correct_questions / test.questions.count.to_f) * 100).to_i
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    return false unless answer_ids

    right_answers = correct_answers.count

    right_answers == correct_answers.where(id: answer_ids).count and
    right_answers == answer_ids.count
  end

  def correct_answers
    current_question.answers.right_answers
  end

  def next_question
    test
      .questions
      .order(:id)
      .where("id > ?", current_question.id)
      .first
  end
end
