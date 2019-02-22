class CreateBalltes < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.integer  :game_id
      t.bigint   :left_team_id
      t.bigint   :right_team_id
      t.datetime :start_time
      t.bigint   :offical_id
      t.bigint   :league_id
      t.integer  :status
      t.integer  :left_score,  default: 0
      t.integer  :right_score, default: 0
      t.integer  :format
      t.integer  :game_no, default: 0, comment: '当前进行到第几场'
      t.boolean  :live,    default: false
    end
  end
end
