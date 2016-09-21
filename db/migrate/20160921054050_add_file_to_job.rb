class AddFileToJob < ActiveRecord::Migration[5.0]
  def change
    add_attachment :jobs, :resume
  end
end
