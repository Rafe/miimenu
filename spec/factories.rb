require 'factory_girl'

Factory.define :user do |u|
  u.name "Tester A"
  u.email "user@example.com"
  u.password "foobar"
end

Factory.sequence :email do |n|
  "Person-#{n}@example.com"
end

Factory.define :ingredient do |i|
  i.name "food"
  i.quantity 1.5
  i.unit "gram"
end

Factory.define :recipe do |r|
  r.name "Great recipe"
  r.description "good things"
  r.instructions "1.cook 2.cook 3.cook"
  r.ingredients {|ingredients| [ingredients.association(:ingredient)] }
end
