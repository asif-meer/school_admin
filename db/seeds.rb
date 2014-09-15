# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@user1 = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << @user1.email

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