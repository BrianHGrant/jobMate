require 'rails_helper'

describe 'the delete a job process', :vcr => true  do
  it "deletes a job" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    company = FactoryGirl.create(:company, user: user)
    contact = FactoryGirl.create(:contact, company: company, user: user)
    job = FactoryGirl.create(:job, company: company, contact: contact,user: user)
    visit company_job_path(company, job)
    click_on 'Delete'
    expect(page).to have_no_content "Engineer"
  end

end
