require 'rails_helper'

describe "the destroy a company process" do
  it "destroys a company" do
    FactoryGirl.create(:quote)
    company = FactoryGirl.create(:company)
    visit company_path(company)
    click_on 'Delete'
    expect(page).to have_no_content "Portland Industries"
  end

end
