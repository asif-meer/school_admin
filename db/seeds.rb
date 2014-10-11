# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# @user1 = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << @user1.email

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

#User
puts "Creating  user"
unless User.find_by_email("user@example.com")
  @user1 = User.new(:email => 'user@example.com',
                  :password => "admin123", 
                  :password_confirmation => "admin123")
  @user1.add_role :admin
  @user1.name = "user"
  @user1.confirm!
  @user1.save
end

#Roles

# puts "creating roles..."

# Role.find_or_create(:name => 'caregiver')
# Role.find_or_create(:name => 'family')
# Role.find_or_create(:name => 'admin')
# Role.find_or_create(:name => 'business')


# # load plans seed file
 # require './db/seeds/school_seed.rb'
 # require './db/seeds/course_seed.rb'

puts "creating school information..."
school1 =  School.find_or_create(:school_name => 'abc school name', :school_address => 'abc area , xyz city pakistan', :school_phone => "01010101",:user_id => @user1.id)

puts "creating course information..."
course1 =  Course.find_or_create(:course_name => 'Course A', :section_name => 'Section A', :code => "AA1" ,:user_id => @user1.id)
course2 =  Course.find_or_create(:course_name => 'Course B', :section_name => 'Section B', :code => "BB1" ,:user_id => @user1.id)
course3 =  Course.find_or_create(:course_name => 'Computer science', :section_name => '', :code => "CS" ,:user_id => @user1.id)


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


