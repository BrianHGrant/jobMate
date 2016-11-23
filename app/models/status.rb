class Status < ActiveRecord::Base
  belongs_to :company, optional: true
  belongs_to :job, optional: true
end
