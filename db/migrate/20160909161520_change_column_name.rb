class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :companies, :type, :category
  end
end
