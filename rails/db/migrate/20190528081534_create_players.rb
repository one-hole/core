class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string      :name
      t.string      :abbr
      t.string      :avatar
      t.references  :team
      t.bigint      :offical_id
      # t.timestamps
    end
  end
end
