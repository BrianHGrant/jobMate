class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.column :company_id, :integer
      t.column :contact_type, :string
      t.column :contact_id, :integer
      t.column :applied, :boolean, default: false
      t.column :applied_date, :string
      t.column :interview, :string
      t.column :offer, :string
      t.column :active, :boolean, default: true

    end
  end
end
