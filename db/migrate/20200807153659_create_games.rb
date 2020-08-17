class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.float :min_bet
      t.integer :number_of_players
      t.integer :winner_id
      t.integer :button_id, default: 0

      t.timestamps
    end
  end
end