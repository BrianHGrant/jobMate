class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :time, :datetime
      t.column :duration, :interval
      t.references :eventable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
