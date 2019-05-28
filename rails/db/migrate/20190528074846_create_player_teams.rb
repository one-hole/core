class CreatePlayerTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :player_teams do |t|
      t.references :player
      t.references :team
      t.datetime   :at    , comment: "Action 发生的时间"
      t.integer    :action, default: 0, comment: "行为、比如加入、比如退出"
    end
  end
end
