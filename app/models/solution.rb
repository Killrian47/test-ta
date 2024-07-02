class Solution < ApplicationRecord
  belongs_to :party

  def find_word_by_party_ten_letter_list
    self.word = File.read('/path/to/your/file.txt').split("\n").select { |word| word.chars.sort == party.ten_letter_list.chars.sort }.join(", ")
    self.save
  end
end
