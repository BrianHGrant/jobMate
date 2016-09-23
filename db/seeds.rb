require 'ffaker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

quotes = Quote.create([{ content: 'The most common way people give up their power is by thinking they don’t have any.', author: 'Alice Walker'}, {content: 'Our finest moments are most likely to occur when we are feeling deeply uncomfortable, unhappy, or unfulfilled. For it is only in such moments, propelled by our discomfort, that we are likely to step out of our ruts and start searching for different ways or truer answers.', author: 'M. Scott Peck'}, {content: 'If the wind will not serve, take to the oars.', author: 'Latin Proverb'}, {content: 'Find out what you like doing best, and get someone to pay you for it.', author: 'Katharine Whitehorn'}, {content: 'Go where you are celebrated—not tolerated. If they can not see the real value of you, it is time for a new start.', author: 'Unknown'}, {content: 'Wanting to be someone else is a waste of the person you are.', author: 'Marilyn Monroe'}, {content: 'The future depends on what you do today.', author: 'Mahatma Gandhi'}, {content: 'You only live once, but if you do it right, once is enough.', author: 'Mae West'}, {content: 'I am not a product of my circumstances. I am a product of my decisions.', author: 'Stephen Covey'}, {content: 'Opportunities do not happen, you create them.', author: 'Chris Grosser'}])


User.create({email: 'john@test.com', password: '123456'})

30.times do
  Company.create({name: FFaker::Company.name, address: FFaker::AddressUS.street_address, category: FFaker::Skill.specialty, rating: rand(1..5), user_id: 1})
end

30.times do
  Contact.create({first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, phone: FFaker::PhoneNumber.short_phone_number, email: FFaker::Internet.email, relationship: (['professional', 'friend', 'teacher', 'mentor', 'family']).sample, position: FFaker::Company.position, user_id: 1, company_id: rand(1..30), linkedIn: 'http://www.linkedIn.com/' })
end

60.times do
  Job.create({title: FFaker::Job.title, post_link: FFaker::Internet.http_url, closing_date: FFaker::Time.between(30.days.ago, 30.days.from_now), posting_date: FFaker::Time.between(30.days.ago, Time.now), priority: rand(3..10), user_id: 1, company_id: rand(1..30), contact_id: rand(1..30) })
end
