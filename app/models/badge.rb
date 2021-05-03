class Badge < ApplicationRecord
  REWARDS = %w[first_time all_level category].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  scope :reward,  -> (name) { where(reward: name) }
  scope :rewards, ->        { all.pluck(:reward) }

  validates :name,   presence: true, uniqueness: { scope: :reward }
  validates :reward, presence: true, uniqueness: true
end
