require 'rails_helper'

describe 'the view jobs process', js:true, :vcr => true  do
  it "shows all jobs" do
    FactoryGirl.create(:quote)
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    company = FactoryGirl.create(:company, user: user)
    contact = FactoryGirl.create(:contact, company: company, user: user)
    job = FactoryGirl.create(:job, company: company, contact: contact, user: user)
    visit root_path
    click_on 'Jobs'
    expect(page).to have_content(job.title)
  end
end
