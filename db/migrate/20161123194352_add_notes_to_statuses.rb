class AddNotesToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :notes, :text
  end
end
