class Test < ApplicationRecord
  TIME_TO_PASS = [0, 5, 10, 15]

  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :category, class_name: "Category", foreign_key: "category_id"
  has_many   :test_passages, dependent: :destroy
  has_many   :questions, dependent: :destroy
  has_many   :users, through: :test_passages

  scope :easy_tests,       -> { where(level: 0..1) }
  scope :medium_tests,     -> { where(level: 2..4) }
  scope :hard_tests,       -> { where(level: 5..Float::INFINITY) }
  scope :tests_categories, -> (category) { joins(:category)
                                             .where("categories.title = ?", category) }

  validates :title, presence:   true,
                    uniqueness: { scope: :level }

  validates :level, presence:     true,
                    numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }

  validates :time_to_pass, presence:     true,
                           numericality: { only_integer: true },
                           inclusion:    { in: TIME_TO_PASS }

  def self.tests_by_category(category)
    tests_categories(category)
      .order(:title)
      .pluck(:title)
  end
end
