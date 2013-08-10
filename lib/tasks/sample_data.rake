namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
    						 screen_name: "Example",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      screen_name = "Example#{n+1}"
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
      						 screen_name: screen_name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   admin: false)
    end
  end
end