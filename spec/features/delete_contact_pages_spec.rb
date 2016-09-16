require 'rails_helper'

describe 'the delete a contact process' do
  it "deletes a contact" do
    FactoryGirl.create(:quote)
    company = FactoryGirl.create(:company)
    contact = FactoryGirl.create(:contact, company: company)
    visit companies_path
    click_on "Castillo, Judy"
    click_on "Delete"
    expect(page).to have_no_content "Castillo, Judy"
  end
end
