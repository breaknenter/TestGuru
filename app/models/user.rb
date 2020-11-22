class User < ApplicationRecord
  def list_of_tests(level)
    Test.joins("JOIN user_tests ON tests.id = user_tests.test_id")
      .where("tests.level = ?", level)
      .order("tests.title")
      .pluck("tests.title")
  end
end
