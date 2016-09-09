require 'rails_helper'

describe Job do
  it {should validate_presence_of :title}
  it {should validate_presence_of :post_link}
  it {should validate_presence_of :closing_date}
  it {should validate_presence_of :posting_date}
  it {should validate_presence_of :priority}
  it {should belong_to :company}
  it {should belong_to :contact}
end
