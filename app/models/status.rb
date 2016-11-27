class Status < ActiveRecord::Base
  belongs_to :company, optional: true
  belongs_to :job, optional: true
  belongs_to :contact, optional: true
  belongs_to :user
end
