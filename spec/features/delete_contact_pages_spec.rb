require 'rails_helper'

describe 'the delete a contact process' do
  it "deletes a contact" do
    company = Company.create(:name => 'Portland Industries', :address => '42 SW 5th Ave', :category => "manufacturing")
    contact = Contact.create(:last_name => 'Castillo', :first_name => 'Judy', :phone => '503-555-5555', :email => 'email@email.com', :relationship => 'friend', :position => 'HR manager', :linkedIn => "http://www.linkedin.com/in/jcastillo", :company_id => company.id)
    visit companies_path
    click_on "Castillo, Judy"
    click_on "Delete"
    expect(page).to have_no_content "Castillo, Judy"
  end
end
