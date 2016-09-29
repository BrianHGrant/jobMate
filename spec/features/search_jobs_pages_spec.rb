require 'rails_helper'

describe 'the search jobs path', js:true do
  it "searches by company" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    company = FactoryGirl.create(:company, user: user)
    company2 = FactoryGirl.create(:company, user: user, name: "Bindendorf and Sons")
    contact = FactoryGirl.create(:contact, company: company, user: user)
    job = FactoryGirl.create(:job, company: company, contact: contact, user: user)
    job = FactoryGirl.create(:job, company: company2, contact: contact, user: user, title: "Tester")
    job = FactoryGirl.create(:job, company: company, contact: contact, user: user)
    visit jobs_path
    select "company"
    fill_in 'search_string', with: "Bindendorf"
    click_on 'Search'
    sleep 4
    expect(page).to have_content "Tester"
    expect(page).to have_no_content "Portland Industries"
  end
  it "searches by job title" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    company = FactoryGirl.create(:company, user: user)
    company2 = FactoryGirl.create(:company, user: user, name: "Bindendorf and Sons")
    contact = FactoryGirl.create(:contact, company: company, user: user)
    job = FactoryGirl.create(:job, company: company, contact: contact, user: user)
    job = FactoryGirl.create(:job, company: company2, contact: contact, user: user, title: "Tester")
    job = FactoryGirl.create(:job, company: company, contact: contact, user: user)
    visit jobs_path
    fill_in 'search_string', with: "Tester"
    click_on 'Search'
    sleep 4
    expect(page).to have_content "Tester"
    expect(page).to have_no_content "Engineer"
  end

  it "searches by job priority" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    company = FactoryGirl.create(:company, user: user)
    company2 = FactoryGirl.create(:company, user: user, name: "Bindendorf and Sons")
    contact = FactoryGirl.create(:contact, company: company, user: user)
    job = FactoryGirl.create(:job, company: company, contact: contact, user: user)
    job = FactoryGirl.create(:job, company: company2, contact: contact, user: user, title: "Tester", priority: 3)
    job = FactoryGirl.create(:job, company: company, contact: contact, user: user, title: "Tester", priority: 6)
    visit jobs_path
    select 'priority'
    fill_in 'search_string', with: 8
    click_on 'Search'
    expect(page).to have_content "Engineer"
    expect(page).to have_no_content "Tester"
  end
end
