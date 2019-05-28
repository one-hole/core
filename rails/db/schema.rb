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

ActiveRecord::Schema.define(version: 2019_05_28_083003) do

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

  create_table "csgo_match_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "infoable_type", default: "Match"
    t.bigint "infoable_id"
    t.integer "map", comment: "地图名"
    t.boolean "result", comment: "True CT胜 & False T胜"
    t.index ["infoable_type", "infoable_id"], name: "index_csgo_match_infos_on_infoable_type_and_infoable_id"
  end

  create_table "csgo_rounds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "match_info_id"
    t.integer "index", default: 0, comment: "回合数"
    t.boolean "result", comment: "True CT胜 & False 代表 T胜"
    t.integer "reason", default: 0, comment: "胜利的理由：死、C4爆炸、C4解除、时间过完"
    t.integer "duration", comment: "持续了多久、单位是秒"
    t.index ["match_info_id"], name: "index_csgo_rounds_on_match_info_id"
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
    t.integer "oh_id"
    t.index ["game_id"], name: "index_leagues_on_game_id"
    t.index ["offical_id", "game_id"], name: "uniq_on_league", unique: true
  end

  create_table "matches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "battle_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean "reverse", default: false, comment: "left - right 用来映射 CT & T | 紫色方 红色方 | radiant & dire 这样的"
    t.string "type"
    t.index ["battle_id"], name: "index_matches_on_battle_id"
  end

  create_table "player_teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "team_id"
    t.datetime "at", comment: "Action 发生的时间"
    t.integer "action", default: 0, comment: "行为、比如加入、比如退出"
    t.index ["player_id"], name: "index_player_teams_on_player_id"
    t.index ["team_id"], name: "index_player_teams_on_team_id"
  end

  create_table "players", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "abbr"
    t.string "avatar"
    t.bigint "team_id"
    t.bigint "offical_id"
    t.index ["team_id"], name: "index_players_on_team_id"
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
    t.integer "oh_id"
    t.index ["game_id"], name: "index_teams_on_game_id"
  end

end
