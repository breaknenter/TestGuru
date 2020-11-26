class User < ApplicationRecord
  has_many :added_tests, class_name: "Test", foreign_key: "author_id"
  has_many :user_tests
  has_many :tests, through: :user_tests

  scope :list_of_tests, -> (level) { joins(:tests).where("tests.level = ?", level)
                                                  .order(:title) }

  validates :name, presence: true
  validates :name, length: { in: 4..16 }

  validates :email, presence:   true
  validates :email, uniqueness: true
end
