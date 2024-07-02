class Party < ApplicationRecord
  validates :word, presence: true
  validates :available, inclusion: { in: [true] }
  validate :validate_word_letters

  def validate_word_letters
    ten_letters_list = self.ten_letters_list.split('')
    word = self.word.split('')
    ten_letters_list.each do |letter|
      if word.include?(letter)
        word.delete_at(word.index(letter))
        ten_letters_list.delete_at(ten_letters_list.index(letter))
      else
        return errors.add(:word, "must be composed of the letters in ten_letters_list")
      end
    end
  end

  belongs_to :game
  has_many :solutions
end
