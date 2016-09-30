require 'rails_helper'

describe "the destroy a company process", :vcr => true  do
  it "destroys a company" do
    FactoryGirl.create(:quote)
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    company = FactoryGirl.create(:company, user: user)
    visit company_path(company)
    click_on 'Delete'
    expect(page).to have_no_content "Portland Industries"
  end

end
