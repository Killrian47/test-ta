class Game < ApplicationRecord
  has_many :parties
  belongs_to :user
end
