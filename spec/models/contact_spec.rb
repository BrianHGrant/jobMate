require 'rails_helper'

describe Contact do
  it {should validate_presence_of :first_name}
  it {should validate_presence_of :last_name}
  it {should validate_presence_of :phone}
  it {should validate_presence_of :email}
  it {should validate_presence_of :relationship}
  it {should validate_presence_of :position}
  it {should validate_presence_of :linkedIn}
  it {should belong_to :company}
  it {should have_many :jobs}
end
