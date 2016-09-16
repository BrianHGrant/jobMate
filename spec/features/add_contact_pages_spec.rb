require 'rails_helper'

describe 'the add a contact process' do
  it "adds a new contact" do
    company = FactoryGirl.create(:company)
    visit company_path(company)
    click_on "Add a contact"
    fill_in "Last name", :with => "Jean"
    fill_in "First name", :with => "Barbara"
    fill_in "Phone", :with => "5035555555"
    fill_in "Email", :with => "example@email.com"
    fill_in "Relationship", :with => "Professional"
    fill_in "Position", :with => "Manager"
    fill_in "Linkedin", :with => "http://wwww.linkedin/in/barbjean05"
    click_on "Save contact"
    expect(page).to have_content "Barbara Jean"
  end

  it "gives error if contact form is incomplete" do
    company = FactoryGirl.create(:company)
    visit company_path(company)
    click_on "Add a contact"
    fill_in "Last name", :with => "Jean"
    fill_in "First name", :with => "Barbara"
    fill_in "Phone", :with => "5035555555"
    fill_in "Email", :with => "example@email.com"
    fill_in "Relationship", :with => ""
    fill_in "Position", :with => "Manager"
    fill_in "Linkedin", :with => "http://wwww.linkedin/in/barbjean05"
    click_on "Save contact"
    expect(page).to have_content "errors"
  end
end
