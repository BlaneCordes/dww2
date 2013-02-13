# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130213010328) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider",   :limit => 10485760
    t.string   "uid",        :limit => 10485760
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "token",      :limit => 10485760
    t.string   "secret",     :limit => 10485760
  end

  create_table "player_articles", :force => true do |t|
    t.integer  "player_id"
    t.integer  "player_feed_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "player_feeds", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "title"
    t.text     "description"
    t.string   "guid"
    t.string   "url"
    t.datetime "published_at"
    t.integer  "player_id"
  end

  create_table "player_feeds_players", :force => true do |t|
    t.integer  "player_id"
    t.integer  "player_feed_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "playerfeedsplayers", :force => true do |t|
    t.integer  "player_id"
    t.integer  "player_feed_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "players", :force => true do |t|
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "eligible_position_one"
    t.string   "lineup_position"
    t.string   "player_key"
    t.string   "name"
    t.string   "team"
    t.integer  "age"
    t.string   "eligible_position_two"
    t.string   "eligible_position_three"
    t.string   "eligible_position_four"
    t.string   "eligible_position_five"
    t.string   "eligible_position_six"
    t.string   "team_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "statistics", :force => true do |t|
    t.integer  "player_id"
    t.integer  "wins"
    t.integer  "losses"
    t.float    "earned_run_average"
    t.integer  "games"
    t.integer  "games_started"
    t.integer  "games_finished"
    t.integer  "complete_games"
    t.integer  "shutouts"
    t.integer  "saves"
    t.float    "innings_pitched"
    t.integer  "hits"
    t.integer  "runs"
    t.integer  "earned_runs"
    t.integer  "home_runs"
    t.integer  "walks"
    t.integer  "intentional_walks"
    t.integer  "strikeouts"
    t.integer  "hit_by_pitch"
    t.integer  "balks"
    t.integer  "wild_pitches"
    t.integer  "batters_faced"
    t.float    "walks_hits_per_innings_pitched"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "season"
    t.integer  "plate_appearances"
    t.integer  "at_bats"
    t.integer  "doubles"
    t.integer  "triples"
    t.integer  "runs_batted_in"
    t.integer  "stolen_bases"
    t.integer  "caught_stealing"
    t.float    "batting_average"
    t.float    "on_base_percentage"
    t.float    "slugging_percentage"
    t.float    "on_base_plus_slugging_percentage"
    t.integer  "total_bases"
    t.integer  "double_plays"
    t.integer  "sacrifice_flies"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "team_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.string   "team_key"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
