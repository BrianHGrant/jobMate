FactoryGirl.define do
  factory :event do

  end
  factory :user do
    email 'test@test.com'
    password '4r56tRx'
  end
  factory :quote do
    content "I think I can"
    author  "Little Engine"
  end

  factory :company do
    name "Airbnb"
    address '42 SW 5th Ave'
    city 'Portland'
    region 'OR'
    category 'manufacturing'
    domain 'airbnb.com'
    factory :company_with_contacts do
      transient do
        contacts_count 5
      end
    end
  end

  factory :contact do
    last_name 'Castillo'
    first_name 'Judy'
    phone '503-555-5555'
    email 'email@email.com'
    relationship 'friend'
    position 'HR manager'
    linkedIn 'http://www.linkedin.com/in/jcastillo'
  end

  factory :job do
    title 'Engineer'
    post_link 'http://www.example.com'
    closing_date '09/25/2016'
    posting_date '09/25/2016'
    priority 8
  end
end
