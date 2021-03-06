# == Schema Information
#
# Table name: employees
#
#  id                   :integer          not null, primary key
#  first_name           :string(255)
#  last_name            :string(255)
#  date_of_birth        :date(255)
#  gender               :string(255)
#  employee_number      :string(255)
#  joining_date         :date
#  department_id        :integer
#  employee_position_id :integer
#  job_title            :string(255)
#  qualification        :string(255)
#  total_experience     :string(255)
#  present_address      :text
#  perminent_address    :text
#  phone                :string(255)
#  email                :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  avatar_file_name     :string(255)
#  avatar_content_type  :string(255)
#  avatar_file_size     :integer
#  avatar_updated_at    :datetime
#

class Employee < ActiveRecord::Base
  belongs_to :department
  belongs_to :employee_position 

  # has_many :classroom_teachers, :foreign_key => :teacher_id
  # has_many :classrooms, :through => :classroom_teachers

  # has_many :class_teachers, :foreign_key => :teacher_id
  # has_many :school_classes, :through => :class_teachers

  has_many :lessons, :foreign_key => :teacher_id
  has_many :school_classes, :through => :lessons

  has_many :classrooms, :through => :lessons

  # has_many :lessons, :foreign_key => :teacher_id
  has_many :subjects, :through => :lessons

  # has_many :lessons, :foreign_key => :teacher_id
  has_many :periods, :through => :lessons

  # has_many :periods

  has_many :educations, :foreign_key => :teacher_id, dependent: :destroy

  has_many :experiences, :foreign_key => :teacher_id, dependent: :destroy
  accepts_nested_attributes_for :experiences, :allow_destroy => true
  accepts_nested_attributes_for :educations, :allow_destroy => true
  # , reject_if: lamda {|a| a["institute_name"].blank?}
  # , reject_if: lamda {|a| a["company"].blank?}

  scope :teachers , -> { joins(:employee_position).where(employee_positions: {:name => "Teacher"}) }

  # validations
  validates_presence_of :employee_number,:first_name,:last_name,
                        :job_title, :employee_position_id, :email, :phone, :date_of_birth,
                        :joining_date, :present_address,
                        :gender

  # File Upload
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  attr_accessor :remove_avatar

  GENDER = ["Male", "Female"]

  def to_s
    "#{first_name} #{last_name}"
  end

  def check_attendence?(dated)
    if self.employee_attendences.present?
      emp = self.employee_attendences.last
      if emp.date < dated.to_date || emp.date > dated.to_date
        "x"
      else
        if emp.Absent?
          "A"
        else
          "P"
        end
      end
    else
      "x"
    end
  end

  def self.teachers_position(*args)
    if args.size == 0 
      position = EmployeePosition.find_by_name("Teacher")
      teacher = position.employees.build    
    else  
      if args.size == 1  
        position = EmployeePosition.find_by_name("Teacher")
        teacher = position.employees.build(args.first)
        teacher.save
      end  
    end      
  end
end
