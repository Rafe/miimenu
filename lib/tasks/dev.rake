namespace :dev do
  
  desc "Rebuild the system"
  task :build => ["tmp:clear", "log:clear", "db:reset", "db:setup"]
  
  desc "Generate fake data"
  task :fake => :environment do
    User.create!(
      :name => "Jimmy Chao",
      :email => "daizenga@gmail.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    )

    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
  
  desc "Run watchr"
  task :watchr do
    system("bundle exec watchr script/watchr.rb")
  end
    
end
