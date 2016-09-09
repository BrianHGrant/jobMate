require 'rails_helper'

describe 'the edit a job process' do
  it "edits a job" do
    company = Company.create(:name => 'Portland Industries', :address => '42 SW 5th Ave', :category => "manufacturing")
    contact = Contact.create(:last_name => 'Castillo', :first_name => 'Judy', :phone => '503-555-5555', :email => 'email@email.com', :relationship => 'friend', :position => 'HR manager', :linkedIn => "http://www.linkedin.com/in/jcastillo", :company_id => company.id)
    job = Job.create(:title => 'Engineer', :post_link => 'http://www.example.com', :closing_date => '09/25/2016', :posting_date => '09/25/2016', :priority => 8, :company_id => company.id, :contact_id => contact.id)
    visit company_job_path(company, job)
    click_on 'Delete'
    expect(page).to have_no_content "Engineer"
  end

end
