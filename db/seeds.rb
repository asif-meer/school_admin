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
  admin_user.add_role :superadmin
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
  @user1.name = "user"
  admin_user.add_role :admin
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
school1 =  School.find_or_create(:school_name => 'abc school name', :school_email => "abc@schooladmin.com", :school_address => 'abc area , xyz city pakistan', :school_phone => "(999)-9999-99",:user_id => User.last.id)

puts "creating course information..."
@course1 =  Course.find_or_create(:course_name => 'B-Tech', :section_name => 'Section A', :code => "AA1" )
@course2 =  Course.find_or_create(:course_name => 'BS CS', :section_name => 'Section B', :code => "BB1" )
@course3 =  Course.find_or_create(:course_name => 'BE', :section_name => 'Section C', :code => "CC1" )
@course4 =  Course.find_or_create(:course_name => 'IT', :section_name => 'Section D', :code => "DD1" )
@course5 =  Course.find_or_create(:course_name => 'Diploma', :section_name => 'Section E', :code => "EE1" )

puts "creating departments..."
depart1 =  Department.find_or_create(:name => "Electronics")
depart2 =  Department.find_or_create(:name => "Computer")
depart3 =  Department.find_or_create(:name => "Psychology")
depart3 =  Department.find_or_create(:name => "Calculas")

puts "creating positions..."
position1 =  EmployeePosition.find_or_create(:name => "Security Guard")
position2 =  EmployeePosition.find_or_create(:name => "Jr. Teacher")
position3 =  EmployeePosition.find_or_create(:name => "Senior teacher")
position4 =  EmployeePosition.find_or_create(:name => "Office Incharge")
position5 =  EmployeePosition.find_or_create(:name => "Wise Pricipal")
position6 =  EmployeePosition.find_or_create(:name => "Pricipal")

puts "creating batches..."
@batch1 =  Batch.find_or_create(:batch_name => "2009", :course_id => @course1.id, :start_date => "7/Jan/2009", :end_date => "13/Nov/2013")
@batch2 =  Batch.find_or_create(:batch_name => "2010", :course_id => @course1.id, :start_date => "7/Jan/2010", :end_date => "13/Nov/2014")
@batch3 =  Batch.find_or_create(:batch_name => "2011", :course_id => @course2.id, :start_date => "7/Jan/2011", :end_date => "13/Nov/2015")
@batch4 =  Batch.find_or_create(:batch_name => "2012", :course_id => @course2.id, :start_date => "7/Jan/2012", :end_date => "13/Nov/2016")
@batch5 =  Batch.find_or_create(:batch_name => "2013", :course_id => @course3.id, :start_date => "7/Jan/2013", :end_date => "13/Nov/2017")
@batch6 =  Batch.find_or_create(:batch_name => "2014", :course_id => @course3.id, :start_date => "7/Jan/2013", :end_date => "13/Nov/2017")
@batch7 =  Batch.find_or_create(:batch_name => "2015", :course_id => @course4.id, :start_date => "7/Jan/2013", :end_date => "13/Nov/2017")
@batch8 =  Batch.find_or_create(:batch_name => "2016", :course_id => @course4.id, :start_date => "7/Jan/2013", :end_date => "13/Nov/2017")
@batch9 =  Batch.find_or_create(:batch_name => "2017", :course_id => @course5.id, :start_date => "7/Jan/2013", :end_date => "13/Nov/2017")
@batch10 =  Batch.find_or_create(:batch_name => "2018", :course_id => @course5.id, :start_date => "7/Jan/2013", :end_date => "13/Nov/2017")
# Subjects
puts "creating subjects"
Subject.find_or_create(:subject_name => "Physics", :batch_id => @batch1.id, :course_id => @course1.id)
Subject.find_or_create(:subject_name => "English Basics", :batch_id => @batch2.id, :course_id => @course1.id)
Subject.find_or_create(:subject_name => "Maths", :batch_id => @batch3.id, :course_id => @course2.id)
Subject.find_or_create(:subject_name => "Advanced Science", :batch_id => @batch4.id, :course_id => @course2.id)
Subject.find_or_create(:subject_name => "Basics Science", :batch_id => @batch5.id, :course_id => @course3.id)
Subject.find_or_create(:subject_name => "Social Studies", :batch_id => @batch6.id, :course_id => @course3.id)
Subject.find_or_create(:subject_name => "Arts and Science", :batch_id => @batch7.id, :course_id => @course4.id)
Subject.find_or_create(:subject_name => "Literature", :batch_id => @batch8.id, :course_id => @course4.id)
Subject.find_or_create(:subject_name => "Enlish Grammar", :batch_id => @batch9.id, :course_id => @course5.id)
Subject.find_or_create(:subject_name => "Psychology", :batch_id => @batch10.id, :course_id => @course5.id)
#Roles
puts "Creating Roles"
Role.find_or_create(:name => 'admin')
Role.find_or_create(:name => 'superadmin')

puts "Creating Student Category"
StudentCategory.find_or_create(:name => 'Regular Student')
StudentCategory.find_or_create(:name => 'Guest Student (non degree seeking student)')
StudentCategory.find_or_create(:name => 'Scholarship Student')


