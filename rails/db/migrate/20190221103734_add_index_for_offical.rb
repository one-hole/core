class AddIndexForOffical < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:teams, :offical_id, nil)
    # add_index(:leagues, [:game_id, :offical_id], unique: true, name: 'uniq_offical_leagues')
    # add_index(:teams, [:game_id, :offical_id], unique: true, name: 'uniq_offical_teams')
    # add_index(:balltes, [:game_id, :offical_id], unique: true, name: 'uniq_offical_balltes')
  end
end
