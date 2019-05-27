class AddTypeToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column(:matches, :type, :string)
  end
end
