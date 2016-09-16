class Add < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :user_id, :integer
    add_column :companies, :user_id, :integer
    add_column :jobs, :user_id, :integer
  end
end
