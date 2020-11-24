class Test < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :category
  has_many   :questions
  has_many   :user_tests
  has_many   :users, through: :user_tests

  def self.tests_by_category(category)
    Test.joins(:category)
        .where("categories.title = ?", category)
        .order("tests.title DESC")
  end
end
