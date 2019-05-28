class RenameColumnOfAwId < ActiveRecord::Migration[6.0]
  def change
    rename_column :teams,   :aw_id, :oh_id
    rename_column :leagues, :aw_id, :oh_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
