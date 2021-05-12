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
    calc_rate >= WIN_RATE
  end

  def calc_rate
    ((correct_questions / test.questions.count.to_f) * 100).to_i
  end

  def finished!
    update(finished: true)
  end

  def question_number
    test.questions.index(current_question) + 1
  end

  def questions_count
    test.questions.size
  end

  def time_left
    (end_time - Time.current).to_i
  end

  def in_time?
    test.time_to_pass.zero? || time_left >= 0
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

  def end_time
    created_at + test.time_to_pass * 60
  end
end
