class Category < ApplicationRecord
  default_scope { select("categories.title").order(:title) }

  has_many :tests

  validates :title, presence:   true
  validates :title, uniqueness: true
end
