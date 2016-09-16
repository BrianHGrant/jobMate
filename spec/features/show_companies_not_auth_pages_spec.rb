require 'rails_helper'

describe 'the view jobs process' do
  it "shows all jobs" do
    FactoryGirl.create(:quote)
    user = FactoryGirl.create(:user)
    company = FactoryGirl.create(:company, user: user)
    visit companies_path
    expect(page).to have_content(company.name)
  end
end
