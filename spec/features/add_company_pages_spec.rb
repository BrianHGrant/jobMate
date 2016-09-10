require 'rails_helper'

describe 'the add a company process' do
  it "adds a new company" do
    visit companies_path
    click_link "New Company"
    fill_in 'Name', :with => "Portland Industries"
    fill_in 'Address', :with => "89 W. 24th St, New York, NY"
    fill_in 'Category', :with => 'Manufacturing'
    click_on "Save Company"
    expect(page).to have_content "Portland Industries"
  end

  it "gives an error when no title or genre is entered" do
    visit companies_path
    click_link "New Company"
    fill_in 'Name', :with => ""
    fill_in 'Address', :with => "89 W. 24th St, New York, NY"
    fill_in 'Category', :with => 'Manufacturing'
    click_on "Save Company"
    expect(page).to have_content 'errors'
  end
end