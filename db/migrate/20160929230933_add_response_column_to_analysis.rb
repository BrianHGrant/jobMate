class AddResponseColumnToAnalysis < ActiveRecord::Migration[5.0]
  def change
    add_column :analyses, :response, :text
  end
end
