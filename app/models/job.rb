class Job < ActiveRecord::Base
  validates_presence_of :title, :post_link, :closing_date, :posting_date, :priority
  belongs_to :company
  belongs_to :contact, optional: true
end
