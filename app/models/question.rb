class Question < ApplicationRecord
  MAX_ANSWERS = 4

  belongs_to :test
  has_many   :answers, dependent: :destroy

  validate :number_of_answers

  validates :text, presence: true

  private

  def number_of_answers
    errors.add(:number_of_answers, "Too many answers! Maximum possible number: #{MAX_ANSWERS}") if answers.size > 3
  end
end
