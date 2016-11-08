require 'rails_helper'

describe 'the add a contact process', js:true, :vcr => true do
  it "adds a new contact" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit companies_path
    click_link "New Company"
    fill_in 'Name', with: "Airbnb"
    find('#company_domain').set("http://www.airbnb.com")
    select 'Internet Publishing and Broadcasting'
    click_on "Save Company"
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
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit companies_path
    click_link "New Company"
    fill_in 'Name', with: "Airbnb"
    find('#company_domain').set("http://www.airbnb.com")
    select 'Internet Publishing and Broadcasting'
    click_on "Save Company"
    click_on "Add a contact"
    fill_in "First name", :with => "Barbara"
    fill_in "Phone", :with => "5035555555"
    fill_in "Email", :with => "example@email.com"
    fill_in "Relationship", :with => "Professional"
    fill_in "Position", :with => "Manager"
    fill_in "Linkedin", :with => "http://wwww.linkedin/in/barbjean05"
    click_on "Save contact"
    expect(page).to have_content "errors"
  end
end
