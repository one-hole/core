class AddIdnexForLeagues < ActiveRecord::Migration[6.0]
  def change
    add_index(:leagues, [:offical_id, :game_id], unique: true, name: "uniq_on_league")
  end
end
