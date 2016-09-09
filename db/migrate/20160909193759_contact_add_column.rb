class ContactAddColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :company_id, :integer
  end
end
