require 'rails_helper'

describe "the edit a company process" do
  it "edits a company" do
    FactoryGirl.create(:quote)
    company = FactoryGirl.create(:company)
    visit company_path(company)
    click_on 'Edit'
    fill_in 'Address', :with => "89 W. 24th St, New York, NY"
    click_on "Save Company"
    expect(page).to have_content "Portland Industries"
  end

  it "gives error when no title is entered" do
    FactoryGirl.create(:quote)
    company = FactoryGirl.create(:company)
    visit company_path(company)
    click_on 'Edit'
    fill_in 'Address', :with => ""
    click_on "Save Company"
    expect(page).to have_content 'errors'
  end
end
