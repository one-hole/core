class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.belongs_to :game, index: true
      t.string    :name
      t.integer   :status
      t.datetime  :start_time
      t.datetime  :end_time
      t.integer   :offical_id, comment: 'HLTV | Steam | LOL'
      t.boolean   :hidden, default: false
      t.string    :logo
      t.string    :second_logo
      t.integer   :aw_id
    end

    create_table :league_aliases do |t|
      t.belongs_to :league, index: true
      t.string :name, null: false, default: ''
    end
  end
end
