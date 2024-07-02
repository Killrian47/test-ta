class AddScoreToParty < ActiveRecord::Migration[7.1]
  def change
    add_column :parties, :score, :integer
  end
end
