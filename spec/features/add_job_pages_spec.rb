require 'rails_helper'

describe 'the add a job process' do
  it "adds a new job" do
    company = FactoryGirl.create(:company)
    contact = FactoryGirl.create(:contact, company: company)
    visit company_path(company)
    click_on "Add a job"
    fill_in "Title", :with => 'Engineer'
    fill_in "Post link", :with => 'http://www.example.com'
    fill_in "Closing date", :with => '09/25/2016'
    fill_in "Posting date", :with => '09/01/2016'
    fill_in "Priority", :with => 8
    select 'Castillo, Judy'
    click_on 'Save Job'
    expect(page).to have_content "Engineer"
  end

  it "gives an error when not all information is entered" do
    company = FactoryGirl.create(:company)
    contact = FactoryGirl.create(:contact, company: company)
    visit company_path(company)
    click_on "Add a job"
    fill_in "Title", :with => ''
    fill_in "Post link", :with => ''
    fill_in "Closing date", :with => '09/25/2016'
    fill_in "Posting date", :with => '09/01/2016'
    fill_in "Priority", :with => 8
    select 'Castillo, Judy'
    click_on 'Save Job'
    expect(page).to have_content "errors"
  end
end
