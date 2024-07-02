class Party < ApplicationRecord
  validates :word, presence: true
  validates :ten_letters_list, presence: true, length: { is: 10 }
  validates :available, inclusion: { in: [true, false] }
  validate :validate_word_letters

  def validate_word_letters
    ten_letters_list.split('').each do |letter|
      if word.count(letter) > ten_letters_list.count(letter)
        errors.add(:word, "can't contain more #{letter}'s than in the ten letters list")
      end
    end

    word.upcase.split('').each do |letter|
      unless ten_letters_list.upcase.include?(letter)
        errors.add(:word, "can't contain letters that are not in the ten letters list")
        break
      end
    end
  end

  belongs_to :game
  has_many :solutions
end
