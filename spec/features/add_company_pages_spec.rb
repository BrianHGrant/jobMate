require 'rails_helper'

describe 'the add a company process', js:true, :vcr => true do
  it "adds a new company" do
    VCR.use_cassette('save_company', :record => :new_episodes) do
      FactoryGirl.create(:quote)
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)
      visit companies_path
      click_link "New Company"
      fill_in 'Name', with: "Airbnb"
      fill_in 'Address', with: "89 W. 24th St"
      fill_in 'City', with: "Portland"
      fill_in 'Category', with: 'Manufacturing'
      click_on "Save Company"
      expect(page).to have_content "Airbnb"
    end
  end

  it "gives an error when no title or genre is entered" do
    FactoryGirl.create(:quote)
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit companies_path
    click_link "New Company"
    fill_in 'Name', :with => ""
    fill_in 'Address', :with => "89 W. 24th St, New York, NY"
    fill_in 'Category', :with => 'Manufacturing'
    click_on "Save Company"
    expect(page).to have_content 'errors'
  end
end
