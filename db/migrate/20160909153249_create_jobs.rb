class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.column :title, :string
      t.column :post_link, :string
      t.column :closing_date, :string
      t.column :posting_date, :string
      t.column :priority, :integer
      t.timestamps
    end
  end
end
