class AddDomainColumnToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :domain, :string
  end
end
