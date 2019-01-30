class CreateTeamAliases < ActiveRecord::Migration[6.0]
  def change
    create_table :team_aliases do |t|

      t.belongs_to :team, index: true
      t.string :name, null: false, :default => ''
    end
  end
end
