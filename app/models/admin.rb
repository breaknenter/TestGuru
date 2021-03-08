class Admin < User
  has_many :added_tests, class_name: "Test", foreign_key: "author_id"

  validates :first_name, presence: true
  validates :last_name,  presence: true
end
