class Game < ApplicationRecord
  has_many :parties
  belongs_to :user

  validates :user, presence: true
  validates :result, presence: true
  validate :check_the_number_of_party

  def check_the_number_of_party
    if self.parties.count > 5
      errors.add(:parties, "can't have more than 5 parties")
    end
  end
end
