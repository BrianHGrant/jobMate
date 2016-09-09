require 'rails_helper'

describe Quote do
  it {should validate_presence_of :content}
  it {should validate_presence_of :author}
end
