require 'rails_helper'

describe 'the edit a contact process' do
  it "edits a contact" do
    FactoryGirl.create(:quote)
    company = FactoryGirl.create(:company)
    contact = FactoryGirl.create(:contact, company: company)
    visit companies_path
    click_on "Castillo, Judy"
    click_on "Edit"
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
end
