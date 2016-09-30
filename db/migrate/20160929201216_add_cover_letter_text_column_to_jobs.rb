class AddCoverLetterTextColumnToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :cover_letter_text, :text
  end
end
