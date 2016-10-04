class AddResponseColumnToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :response, :text
  end
end
