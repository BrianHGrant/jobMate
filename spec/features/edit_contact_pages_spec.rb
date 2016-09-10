require 'rails_helper'

describe 'the edit a contact process' do
  it "edits a contact" do
    company = Company.create(:name => 'Portland Industries', :address => '42 SW 5th Ave', :category => "manufacturing")
    contact = Contact.create(:last_name => 'Castillo', :first_name => 'Judy', :phone => '503-555-5555', :email => 'email@email.com', :relationship => 'friend', :position => 'HR manager', :linkedIn => "http://www.linkedin.com/in/jcastillo", :company_id => company.id)
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
