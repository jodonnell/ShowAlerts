require 'factory_girl'

Factory.define :band do |b|
  b.name 'M83'
end

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@test.com'
  u.password 'please'

  u.after_create do |user|
    user.bands.create :name => 'M83'
  end
end

Factory.define :show do |s|
  s.bands 'M83'
  s.date Date.parse("2012/01/20")
  s.location 'Location'
  s.ticket_link '<a href="http://google.com">Tickets</a>'
end

