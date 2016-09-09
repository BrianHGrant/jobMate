require 'rails_helper'

describe "the destroy a company process" do
  it "destroys a company" do
    company = Company.create(:name => 'Portland Industries', :address => '42 SW 5th Ave', :category => "manufacturing")
    visit company_path(company)
    click_on 'Delete'
    expect(page).to have_no_content "Portland Industries"
  end

end
