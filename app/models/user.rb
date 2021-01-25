class User < ApplicationRecord
  has_many :added_tests, class_name: "Test", foreign_key: "author_id"
  has_many :test_passages
  has_many :tests, through: :test_passages

  scope :list_of_tests, -> (level) { joins(:tests)
  	                                   .where("tests.level = ?", level)
                                       .order(:title) }

  validates :name,  presence: true, length: { in: 4..16 }
  validates :email, presence: true, uniqueness: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
