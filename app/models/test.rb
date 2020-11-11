class Test < ApplicationRecord
  def self.tests_by_category(category)
    Test.joins("JOIN categories ON category_id = tests.category_id")
      .where("categories.title = ?", category)
      .order("tests.title DESC")
      .pluck("tests.title")
  end
end
