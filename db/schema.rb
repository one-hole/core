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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_21_281353) do

  create_table "balltes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "game_id"
    t.bigint "left_team_id"
    t.bigint "right_team_id"
    t.datetime "start_time"
    t.bigint "offical_id"
    t.bigint "league_id"
    t.integer "status"
    t.integer "left_score", default: 0
    t.integer "right_score", default: 0
    t.integer "format"
    t.integer "game_no", default: 0, comment: "当前进行到第几场"
    t.boolean "live", default: false
  end

  create_table "battles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "game_id"
    t.bigint "left_team_id"
    t.bigint "right_team_id"
    t.datetime "start_time"
    t.bigint "offical_id"
    t.bigint "league_id"
    t.integer "status"
    t.integer "left_score", default: 0
    t.integer "right_score", default: 0
    t.integer "format"
    t.integer "game_no", default: 0, comment: "当前进行到第几场"
    t.boolean "live", default: false
  end

  create_table "games", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "cn_name"
  end

  create_table "league_aliases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "league_id"
    t.string "name", default: "", null: false
    t.index ["league_id"], name: "index_league_aliases_on_league_id"
  end

  create_table "leagues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "game_id"
    t.string "name"
    t.integer "status"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "offical_id", comment: "HLTV | Steam | LOL"
    t.boolean "hidden", default: false
    t.string "logo"
    t.string "second_logo"
    t.integer "aw_id"
    t.index ["game_id"], name: "index_leagues_on_game_id"
  end

  create_table "team_aliases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "team_id"
    t.string "name", default: "", null: false
    t.index ["team_id"], name: "index_team_aliases_on_team_id"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "game_id", comment: "队伍需要关联到游戏"
    t.string "name", default: ""
    t.string "abbr", default: ""
    t.string "logo", default: ""
    t.bigint "offical_id", comment: "Dota2: SteamID | CSGO: HLTVID"
    t.string "country"
    t.string "region"
    t.boolean "operated", default: false, comment: "队伍是否运营过"
    t.integer "aw_id", comment: "电竞大师的 ID"
    t.index ["game_id"], name: "index_teams_on_game_id"
  end

end
