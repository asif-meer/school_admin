module EmployeesHelper
  def attendence_label(value)
    if value.employee_attendences.first.label == 0
      "Present"
    elsif value.employee_attendences.first.label == 1
      "Absent"
    else
      "Blank"
    end
  end
end
