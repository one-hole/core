class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.belongs_to :game, index: true, comment: '队伍需要关联到游戏'
      t.string :name, default: ""
      t.string :abbr, default: ""
      t.string :logo, default: ""
      t.bigint :offical_id, default: -1, comment: 'Dota2: SteamID | CSGO: HLTVID'
      t.boolean :operated,  default: false, comment: '队伍是否运营过'
    end
  end
end
