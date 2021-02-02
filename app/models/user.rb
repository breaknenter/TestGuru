class User < ApplicationRecord
  VALID_NAME_REGEXP     = /\A[A-Za-z]+\w+([A-Za-z]|\d)+\z/
  VALID_EMAIL_REGEXP    = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_REQUIREMENTS = //

  has_many :added_tests, class_name: "Test", foreign_key: "author_id"
  has_many :test_passages
  has_many :tests, through: :test_passages

  before_save { email.downcase! if email }

  validates :name,
            presence:   true,
            uniqueness: true,
            length:     { in: 4..20 },
            format:     { with: VALID_NAME_REGEXP }

  validates :email,
            presence:   true,
            uniqueness: { case_sensitive: false },
            format:     { with: VALID_EMAIL_REGEXP }

  validates :password,
            presence: true,
            length:   { in: 8..40 },
            if:       -> { password_digest.empty? }

  validates :password, confirmation: true

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
