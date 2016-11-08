class Contact < ActiveRecord::Base
  # includes

  belongs_to :company, optional: true
  belongs_to :user
  has_many :jobs
  has_many :events, :as => :eventable

  validates_presence_of :first_name, :last_name, :phone, :email, :relationship, :position, :linkedIn

  # scopes
end
