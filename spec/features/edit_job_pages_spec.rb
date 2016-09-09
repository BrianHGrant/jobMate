require 'rails_helper'

describe 'the edit a job process' do
  it "edits a job" do
    company = Company.create(:name => 'Portland Industries', :address => '42 SW 5th Ave', :category => "manufacturing")
    contact = Contact.create(:last_name => 'Castillo', :first_name => 'Judy', :phone => '503-555-5555', :email => 'email@email.com', :relationship => 'friend', :position => 'HR manager', :linkedIn => "http://www.linkedin.com/in/jcastillo", :company_id => company.id)
    job = Job.create(:title => 'Engineer', :post_link => 'http://www.example.com', :closing_date => '09/25/2016', :posting_date => '09/25/2016', :priority => 8, :company_id => company.id, :contact_id => contact.id)
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
    company = Company.create(:name => 'Portland Industries', :address => '42 SW 5th Ave', :category => "manufacturing")
    contact = Contact.create(:last_name => 'Castillo', :first_name => 'Judy', :phone => '503-555-5555', :email => 'email@email.com', :relationship => 'friend', :position => 'HR manager', :linkedIn => "http://www.linkedin.com/in/jcastillo", :company_id => company.id)
    job = Job.create(:title => 'Engineer', :post_link => 'http://www.example.com', :closing_date => '09/25/2016', :posting_date => '09/25/2016', :priority => 8, :company_id => company.id, :contact_id => contact.id)
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
