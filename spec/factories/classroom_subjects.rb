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

FactoryGirl.define do
  factory :classroom_subject, :class => 'ClassroomSubjects' do
    classroom_id 1
subject_id 1
  end

end
