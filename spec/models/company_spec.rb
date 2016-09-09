require 'rails_helper'

describe Company do
  it {should validate_presence_of :name}
  it {should validate_presence_of :address}
  it {should validate_presence_of :category}
  it {should have_many :contacts}
  it {should have_many :jobs}
end
