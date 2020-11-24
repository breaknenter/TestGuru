class User < ApplicationRecord
  has_many :tests
  has_many :user_tests
  has_many :tests, through: :user_tests

  def list_of_tests(level)
    tests.where(level: level).order("tests.title")
  end
end
