class Quote < ActiveRecord::Base
  validates_presence_of :content, :author
end
