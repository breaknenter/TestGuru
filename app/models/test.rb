class Test < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :category
  has_many   :questions
  has_many   :user_tests
  has_many   :users, through: :user_tests

  scope :easy_tests,       -> { where(level: 0..1) }
  scope :medium_tests,     -> { where(level: 2..4) }
  scope :hard_tests,       -> { where(level: 5..Float::INFINITY) }
  scope :tests_categories, -> (category) { joins(:category)
                                             .where("categories.title = ?", category) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, presence: true,
                    numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }

  def self.tests_by_category(category)
    tests_categories(category)
      .order(:title)
      .pluck(:title)
  end
end
