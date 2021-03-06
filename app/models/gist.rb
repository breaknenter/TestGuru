class Gist < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :user
  belongs_to :question
end
