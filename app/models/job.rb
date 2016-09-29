class Job < ActiveRecord::Base
  validates_presence_of :title, :post_link, :closing_date, :posting_date, :priority
  belongs_to :company
  belongs_to :contact, optional: true
  belongs_to :user
  has_attached_file :resume
  validates_attachment :resume, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
  has_attached_file :cover_letter
  validates_attachment :cover_letter, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  def self.search(search_column, search)
    if search_column == 'company'
      where("company_id IN (?)", search)
    elsif search_column == 'title'
      where("title ILIKE ?", search)
    elsif search_column == 'priority'
      where("priority IN (?)", search)
    else
      where(nil)
    end
  end
end
