class AddNewsResponseToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :news_response, :text
  end
end
