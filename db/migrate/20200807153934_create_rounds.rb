class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.string :current_player_id
      t.float :min_bet
      t.float :max_bet
      t.string :step
      t.string :avail_players
      t.float :pool
      t.boolean :is_over
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
