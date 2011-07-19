require 'factory_girl'

Factory.define :user do |u|
  u.name "Tester A"
  u.email "user@example.com"
  u.password "foobar"
end

Factory.sequence :email do |n|
  "Person-#{n}@example.com"
end
