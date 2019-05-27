class CreateCsgoRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :csgo_rounds do |t|
      t.references :match_info
      t.integer    :index,  default: 0, comment: "回合数"
      t.boolean    :result,             comment: "True CT胜 & False 代表 T胜"
      t.integer    :reason, default: 0, comment: "胜利的理由：死、C4爆炸、C4解除、时间过完"
      t.integer    :duration,           comment: "持续了多久、单位是秒"
    end
  end
end
