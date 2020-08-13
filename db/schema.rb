# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_12_223922) do

  create_table "games", force: :cascade do |t|
    t.string "winner"
    t.float "pot"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_games", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_player_games_on_game_id"
    t.index ["player_id"], name: "index_player_games_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.float "account_balance", default: 1000.0
    t.float "game_balance", default: 100.0
    t.float "amount_bet", default: 100.0
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.string "current_player_id"
    t.float "min_bet"
    t.float "max_bet"
    t.string "step"
    t.string "avail_players"
    t.float "pool"
    t.boolean "is_over"
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_rounds_on_game_id"
  end

  add_foreign_key "player_games", "games"
  add_foreign_key "player_games", "players"
  add_foreign_key "rounds", "games"
end
