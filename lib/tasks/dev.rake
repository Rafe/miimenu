namespace :dev do
  
  desc "Rebuild the system"
  task :build => ["tmp:clear", "log:clear", "db:reset", "db:setup"]
  
  desc "Generate fake data"
  task :fake => :environment do
    Rake::Task["db:reset"].invoke

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


    20.times do |id|
      name = "Test Dish"
      instructions = """
1. cook  
2. cook  
3. cook
"""
      description = "some good dish"
      tags = "chinese spicy healthy"
      user = User.find(id+1)
      ingredients = [
        Ingredient.new(name:"soysauce",quantity:"1.5 tea spoon"),
        Ingredient.new(name:"pork belle",quantity:"200g")
      ]
      recipe = user.recipes.create(
        :name => name,
        :description => description,
        :instructions => instructions,
        :tags => tags,
        :image => File.open(Dir.glob(File.join(Rails.root,"public/sample.jpg")).sample),
        :ingredients => ingredients
      )
    end
  end
  
  desc "Run watchr"
  task :watchr do
    system("bundle exec watchr script/watchr.rb")
  end
    
end
