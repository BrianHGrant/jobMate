require 'rails_helper'

describe 'the edit a job process' do
  it "edits a job" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    company = FactoryGirl.create(:company, user: user)
    contact = FactoryGirl.create(:contact, company: company, user: user)
    job = FactoryGirl.create(:job, company: company, contact: contact, user: user)
    visit company_job_path(company, job)
    click_on "Edit"
    fill_in "Title", :with => 'Mechanical Engineer'
    fill_in "Post link", :with => 'http://www.example.com/example.html'
    fill_in "Closing date", :with => '09/05/2016'
    fill_in "Posting date", :with => '09/01/2016'
    fill_in "Priority", :with => 4
    select 'Castillo, Judy'
    click_on 'Save Job'
    expect(page).to have_content "Mechanical Engineer"
  end

  it "gives an error when information is not complete" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    company = FactoryGirl.create(:company, user: user)
    contact = FactoryGirl.create(:contact, company: company, user: user)
    job = FactoryGirl.create(:job, company: company, contact: contact, user: user)
    visit company_job_path(company, job)
    click_on "Edit"
    fill_in "Title", :with => ''
    fill_in "Post link", :with => 'http://www.example.com/example.html'
    fill_in "Closing date", :with => '09/05/2016'
    fill_in "Posting date", :with => '09/01/2016'
    fill_in "Priority", :with => 4
    select 'Castillo, Judy'
    click_on 'Save Job'
    expect(page).to have_content "errors"
  end
end
