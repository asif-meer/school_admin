# == Schema Information
#
# Table name: employees
#
#  id                   :integer          not null, primary key
#  first_name           :string(255)
#  last_name            :string(255)
#  date_of_birth        :string(255)
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

require 'rails_helper'

RSpec.describe Employee, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
