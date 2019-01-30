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

ActiveRecord::Schema.define(version: 2019_01_30_104940) do

  create_table "games", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "cn_name"
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
    t.bigint "offical_id", default: -1, comment: "Dota2: SteamID | CSGO: HLTVID"
    t.string "country"
    t.string "region"
    t.boolean "operated", default: false, comment: "队伍是否运营过"
    t.integer "aw_id", comment: "电竞大师的 ID"
    t.index ["game_id"], name: "index_teams_on_game_id"
  end

end
