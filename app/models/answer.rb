class Answer < ApplicationRecord
  belongs_to :question

  scope :right_answers, -> { where(correct: true) }

  validates :text, presence: true
  validates :correct, inclusion: [true, false]
end
