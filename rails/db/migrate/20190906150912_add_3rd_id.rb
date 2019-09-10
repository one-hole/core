class Add3rdId < ActiveRecord::Migration[6.0]
  def change
    add_column(:teams, 'trdid', :string)
    add_column(:leagues, 'trdid', :string)
    add_column(:battles, 'trdid', :string)

    add_index(:teams, 'trdid', unique: true)
    add_index(:leagues, 'trdid', unique: true)
    add_index(:battles, 'trdid', unique: true)
  end
end
