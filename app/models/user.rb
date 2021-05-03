class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :user_badges
  has_many :badges, through: :user_badges

  has_many :gists, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name,  presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    type == "Admin"
  end
end
