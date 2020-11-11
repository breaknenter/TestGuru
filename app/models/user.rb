class User < ApplicationRecord
  def list_of_tests(level)
    User.joins("JOIN tests ON user_tests.user_id = user_tests.test_id")
      .where("tests.level = ?", level)
      .order("tests.title")
      .pluck("tests.title")
  end
end
