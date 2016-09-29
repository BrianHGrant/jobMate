class AddColumnsToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :city, :string
    add_column :companies, :region, :string
    add_column :companies, :logo, :string
    add_column :companies, :founded, :integer
    add_column :companies, :size, :integer
  end
end
