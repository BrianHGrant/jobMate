class RenameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :contacts, :postion, :position
  end
end
