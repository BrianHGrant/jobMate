class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :phone, :string
      t.column :email, :string
      t.column :relationship, :string
      t.column :postion, :string
      t.column :linkedIn, :string
      t.timestamps
    end
  end
end
