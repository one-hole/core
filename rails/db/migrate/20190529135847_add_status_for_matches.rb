class AddStatusForMatches < ActiveRecord::Migration[6.0]
  def change
    add_column(:matches, :state, :integer, default: 0)
  end
end
