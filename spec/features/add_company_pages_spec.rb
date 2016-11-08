require 'rails_helper'

describe 'the add a company process', js:true do
  it "adds a new company" do
    VCR.use_cassette('save_company', :record => :new_episodes) do
      FactoryGirl.create(:quote)
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)
      visit companies_path
      click_link "New Company"
      fill_in 'Name', with: "Vacasa"
      find('#company_domain').set("http://www.vacasa.com")
      select 'Internet Publishing and Broadcasting'
      click_on "Save Company"
      expect(page).to have_content "Vacasa"
    end
  end

  it "gives an error when no company name is entered" do
    FactoryGirl.create(:quote)
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit companies_path
    click_link "New Company"
    fill_in 'Name', :with => ""
    select 'Internet Publishing and Broadcasting'
    click_on "Save Company"
    expect(page).to have_content 'errors'
  end
end
