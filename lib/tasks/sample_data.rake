require 'faker'

namespace :db do
	#my custom rake task to add fake data
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "steve",
                 :email => "steve@hotmail.com",
                 :password => "ngprague153",
                 :password_confirmation => "ngprague153" )

#NB admin isn't acessible for security reasons so we use the safe method to set its value
    admin.toggle!(:admin)

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password )
    end
  end
end

