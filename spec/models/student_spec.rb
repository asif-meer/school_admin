# == Schema Information
#
# Table name: students
#
#  id                      :integer          not null, primary key
#  first_name              :string(255)
#  last_name               :string(255)
#  date_of_birth           :date
#  nic                     :string(255)
#  address                 :text
#  gender                  :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  avatar_file_name        :string(255)
#  avatar_content_type     :string(255)
#  avatar_file_size        :integer
#  avatar_updated_at       :datetime
#  general_register_number :integer
#  joining_date            :date
#  course_id               :integer
#  batch_id                :integer
#  roll_number             :string(255)
#

require 'rails_helper'

RSpec.describe Student, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
