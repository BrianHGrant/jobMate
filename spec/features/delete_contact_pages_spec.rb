require 'rails_helper'

describe 'the delete a contact process' do
  it "deletes a contact" do
    FactoryGirl.create(:quote)
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    company = FactoryGirl.create(:company, user: user)
    contact = FactoryGirl.create(:contact, company: company, user: user)
    visit contacts_path
    click_on "Castillo, Judy"
    click_on "Delete"
    expect(page).to have_no_content "Castillo, Judy"
  end
end
