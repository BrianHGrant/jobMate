class Company < ActiveRecord::Base
  validates_presence_of :name, :address, :category
  has_many :contacts
  has_many :jobs
  belongs_to :user
end
