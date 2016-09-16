class Contact < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :phone, :email, :relationship, :position, :linkedIn
  belongs_to :company, optional: true
  belongs_to :user
  has_many :jobs
end
