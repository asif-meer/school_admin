# == Schema Information
#
# Table name: classroom_subjects
#
#  id           :integer          not null, primary key
#  classroom_id :integer
#  subject_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class ClassroomSubject < ActiveRecord::Base
	belongs_to :classroom
	belongs_to :subject
end
