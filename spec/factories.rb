require 'factory_girl'

Factory.sequence :email do |n|
  "Person-#{n}@example.com"
end

Factory.define :user do |u|
  u.name "Tester A"
  u.email { Factory.next(:email) }
  u.password "foobar"
end

Factory.define :ingredient do |i|
  i.name "food"
  i.quantity "1.5 gram"
end

Factory.define :recipe do |r|
  r.name "Great recipe"
  r.description "good things"
  r.instructions "1.cook 2.cook 3.cook"
  r.ingredients {|ingredients| [ingredients.association(:ingredient)] }
  r.tags "chinese, japanese, spicy"
end

Factory.define :comment do |c|
  c.text "test"
end
