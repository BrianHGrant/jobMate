class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.column :content, :string
      t.column :author, :string
    end
  end
end
