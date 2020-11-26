class Test < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :category
  has_many   :questions
  has_many   :user_tests
  has_many   :users, through: :user_tests

  scope :easy_tests,   -> { where(level: 0..1) }
  scope :medium_tests, -> { where(level: 2..4) }
  scope :hard_tests,   -> { where(level: 5..Float::INFINITY) }

  scope :tests_by_category, -> (category) { joins(:category).where("categories.title = ?", category)
                                                            .order(:title) }

  validates :title, presence:   true
  validates :title, uniqueness: true

  validates :level, presence: true
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }
end
