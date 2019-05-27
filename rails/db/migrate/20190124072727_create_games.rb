class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :cn_name
    end

    Game.create(name: 'dota2', cn_name: '刀塔2')
    Game.create(name: 'csgo', cn_name: 'CSGO')
    Game.create(name: 'lol', cn_name: '英雄联盟')
    Game.create(name: 'kog', cn_name: '王者荣耀')
  end
end
