class AddResponseColumnToAnalysesTable < ActiveRecord::Migration[5.0]
  def change
    add_column :analyses, :response, :string, array: true, default: []
  end
end
