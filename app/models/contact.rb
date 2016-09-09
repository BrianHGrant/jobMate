class Contact < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :phone, :email, :relationship, :position, :linkedIn
  belongs_to :company
  has_many :jobs
end
