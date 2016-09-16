require 'rails_helper'

describe 'the edit a contact process' do
  it "edits a contact" do
    FactoryGirl.create(:quote)
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    company = FactoryGirl.create(:company, user: user)
    contact = FactoryGirl.create(:contact, company: company, user: user)
    visit contacts_path
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
