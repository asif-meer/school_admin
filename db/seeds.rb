# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

#Roles
puts "Creating Roles"
Role.find_or_create(:name => 'admin')

#Admin
puts "Creating admin user"
unless User.find_by_email("superadmin@example.com")
  admin_user = User.new(:email => 'superadmin@example.com',
                  :password => "superadmin123", 
                  :password_confirmation => "superadmin123")
    admin_user.add_role :admin
    admin_user.name = "superadmin"
    admin_user.confirm!
    admin_user.save
    
end