class AddCoverLetterToJob < ActiveRecord::Migration[5.0]
  def change
    add_attachment :jobs, :cover_letter
  end
end
