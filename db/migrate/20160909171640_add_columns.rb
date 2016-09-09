class AddColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :company_id, :integer
    add_column :jobs, :contact_id, :integer
  end
end
