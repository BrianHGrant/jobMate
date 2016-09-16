require 'rails_helper'

describe 'the delete a job process' do
  it "deletes a job" do
    company = FactoryGirl.create(:company)
    contact = FactoryGirl.create(:contact, company: company)
    job = FactoryGirl.create(:job, company: company, contact: contact)
    visit company_job_path(company, job)
    click_on 'Delete'
    expect(page).to have_no_content "Engineer"
  end

end
