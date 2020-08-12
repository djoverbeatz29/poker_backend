class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.float :account_balance, default: 1000
      t.float :game_balance, default: 100
      t.float :amount_bet, default: 100
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest, default: 'password'

      t.timestamps
    end
  end
end
