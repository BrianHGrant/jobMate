class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.column :name, :string
      t.column :address, :string
      t.column :type, :string
      t.column :rating, :string
      t.timestamps
    end
  end
end
