class AddResultToGame < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :result, :integer
  end
end
