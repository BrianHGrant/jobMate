
class Job < ActiveRecord::Base

  belongs_to :company
  belongs_to :contact, optional: true
  belongs_to :user
  has_many :events, :as => :eventable
  before_update :get_text, if: :cover_letter_text_changed?

  has_attached_file :resume
  validates_attachment :resume, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  has_attached_file :cover_letter
  validates_attachment :cover_letter, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  validates_presence_of :title, :post_link, :closing_date, :posting_date, :priority

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

  private

  def get_text

      self.cover_letter_text = ""

      PDF::Reader.open(self.cover_letter.queued_for_write[:original].path) do |reader|
        reader.pages.each do |page|
          self.cover_letter_text = self.cover_letter_text + " " + page.text
        end
      end
  end
end
