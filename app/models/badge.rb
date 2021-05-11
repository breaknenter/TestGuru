class Badge < ApplicationRecord
  REWARDS = %w[first_time all_level category].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :rule,   presence: true, uniqueness: { scope: %i[value reward] }
  validates :value,  presence: true
  validates :reward, presence: true, inclusion: { in: REWARDS }
end
