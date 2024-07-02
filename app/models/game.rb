class Game < ApplicationRecord
  has_many :parties
  belongs_to :user

  validates :user, presence: true
  validates :result, presence: true
end
