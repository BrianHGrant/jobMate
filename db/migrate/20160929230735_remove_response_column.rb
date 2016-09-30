class RemoveResponseColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :analyses, :response
  end
end
