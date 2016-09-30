require 'rails_helper'

describe "the edit a company process", :vcr => true  do
  it "edits a company" do
    FactoryGirl.create(:quote)
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    company = FactoryGirl.create(:company, user: user)
    visit company_path(company)
    click_on 'Edit'
    fill_in 'Address', :with => "89 W. 24th St, New York, NY"
    click_on "Save Company"
    expect(page).to have_content "Airbnb"
  end

  it "gives error when no title is entered" do
    FactoryGirl.create(:quote)
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    company = FactoryGirl.create(:company, user: user)
    visit company_path(company)
    click_on 'Edit'
    fill_in 'Address', :with => ""
    click_on "Save Company"
    expect(page).to have_content 'errors'
  end
end
