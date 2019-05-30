class CreatePlayerMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :player_matches do |t|
      t.belongs_to :player
      t.belongs_to :match
      t.integer    :position, comment: "位置"
      t.integer    :hero,     comment: "玩的英雄"
    end
  end
end
