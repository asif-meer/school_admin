$(function() {
    $('form').bootstrapValidator({
      framework: 'bootstrap',
      feedbackIcons: {
          valid: 'glyphicon glyphicon-ok',
          invalid: 'glyphicon glyphicon-remove',
          validating: 'glyphicon glyphicon-refresh'
      },
      fields: {
        'user[email]': {
            validators: {
                notEmpty: {
                    message: 'The email address is required and cannot be empty'
                },
                emailAddress: {
                    message: 'The email address is not a valid'
                }
            }
        },
        'user[password]': {
            validators: {
                notEmpty: {
                    message: 'The password is required and cannot be empty'
                },
                different: {
                    field: 'username',
                    message: 'The password cannot be the same as username'
                },
                stringLength: {
                    min: 8,
                    message: 'The password must have at least 8 characters'
                }
            }
        },
        'course[course_name]': {
            validators: {
                notEmpty: {
                    message: 'Course name cannot be empty'
                }
            }
        },
        'course[section_name]': {
            validators: {
                notEmpty: {
                    message: 'Section name name cannot be empty'
                }
            }
        },
        'course[code]': {
            validators: {
                notEmpty: {
                    message: 'Code cannot be empty'
                }
            }
        },
        'batch[course_id]': {
            validators: {
                notEmpty: {
                    message: 'Course cannot be empty'
                }
            }
        },
        'batch[batch_name]': {
            validators: {
                notEmpty: {
                    message: 'Batch name cannot be empty'
                }
            }
        },
        'batch[start_date]': {
            validators: {
                notEmpty: {
                    message: 'Start date cannot be empty'
                }
            }
        },
        'batch[end_date]': {
            validators: {
                notEmpty: {
                    message: 'End date cannot be empty'
                }
            }
        },
        'session[name]': {
            validators: {
                notEmpty: {
                    message: 'Session name cannot be empty'
                }
            }
        },
        'session[start_date]': {
            validators: {
                notEmpty: {
                    message: 'Start date cannot be empty'
                },
                date: {
                    format: 'YYYY/MM/DD',
                    message: 'The Start date is not valid'
                }
            }
        },
        'session[end_date]': {
            validators: {
                notEmpty: {
                    message: 'End date cannot be empty'
                },
                date: {
                    format: 'YYYY/MM/DD',
                    message: 'The End date is not valid'
                }
            }
        },
        'school_class[class_name]': {
            validators: {
                notEmpty: {
                    message: 'Class name cannot be empty'
                }
            }
        },
        'school_class[short_name]': {
            validators: {
                notEmpty: {
                    message: 'Short Name cannot be empty'
                }
            }
        },
        'period[name]': {
            validators: {
                notEmpty: {
                    message: 'Name cannot be empty'
                }
            }
        },
        'period[short]': {
            validators: {
                notEmpty: {
                    message: 'Short Name cannot be empty'
                }
            }
        },
        'period[start_time]': {
            validators: {
                notEmpty: {
                    message: 'Start Time cannot be empty'
                }
            }
        },
        'period[end_time]': {
            validators: {
                notEmpty: {
                    message: 'End Time cannot be empty'
                }
            }
        },
        'subject[title]': {
            validators: {
                notEmpty: {
                    message: 'Title cannot be empty'
                }
            }
        },
        'subject[short_name]': {
            validators: {
                notEmpty: {
                    message: 'Short Name cannot be empty'
                }
            }
        },
        'subject[classroom_ids][]': {
            validators: {
                notEmpty: {
                    message: 'Classroom cannot be empty'
                }
            }
        },
        'lesson[period_id]': {
            validators: {
                notEmpty: {
                    message: 'Period cannot be empty'
                }
            }
        },
        'lesson[teacher_id]': {
            validators: {
                notEmpty: {
                    message: 'Teacher cannot be empty'
                }
            }
        },
        'lesson[school_class_id]': {
            validators: {
                notEmpty: {
                    message: 'Classes cannot be empty'
                }
            }
        },
        'lesson[subject_id]': {
            validators: {
                notEmpty: {
                    message: 'Subject cannot be empty'
                }
            }
        },
        'lesson[week_day_id]': {
            validators: {
                notEmpty: {
                    message: 'Week Days cannot be empty'
                }
            }
        },
        'lesson[classroom_id]': {
            validators: {
                notEmpty: {
                    message: 'Classroom cannot be empty'
                }
            }
        },
        'classroom[classroom_name]': {
            validators: {
                notEmpty: {
                    message: 'Classroom Name cannot be empty'
                }
            }
        },
        'classroom[short_name]': {
            validators: {
                notEmpty: {
                    message: 'Short Name cannot be empty'
                }
            }
        },
        'employee[first_name]': {
            validators: {
                notEmpty: {
                    message: 'First name cannot be empty'
                }
            }
        },
        'employee[last_name]': {
            validators: {
                notEmpty: {
                    message: 'Last name cannot be empty'
                }
            }
        },
        'employee[date_of_birth]': {
            validators: {
                notEmpty: {
                    message: 'Date of birth cannot be empty'
                },
                date: {
                    format: 'YYYY/MM/DD',
                    message: 'Date of birth is not valid'
                }
            }
        },
        'employee[gender]': {
            validators: {
                notEmpty: {
                    message: 'Gender cannot be empty'
                }
            }
        },
        'employee[employee_number]': {
            validators: {
                notEmpty: {
                    message: 'Employee Number cannot be empty'
                }
            }
        },
        'employee[joining_date]': {
            validators: {
                notEmpty: {
                    message: 'Joining Date cannot be empty'
                },
                date: {
                    format: 'YYYY/MM/DD',
                    message: 'Joining Date is not valid'
                }
            }
        },
        'employee[department_id]': {
            validators: {
                notEmpty: {
                    message: 'Department cannot be empty'
                }
            }
        },
        'employee[employee_position_id]': {
            validators: {
                notEmpty: {
                    message: 'Employee Position cannot be empty'
                }
            }
        },
        'employee[job_title]': {
            validators: {
                notEmpty: {
                    message: 'job Title cannot be empty'
                }
            }
        },
        // 'employee[qualification]': {
        //     validators: {
        //         notEmpty: {
        //             message: 'Qualification cannot be empty'
        //         }
        //     }
        // },
        // 'employee[total_experience]': {
        //     validators: {
        //         notEmpty: {
        //             message: 'Total Experience cannot be empty'
        //         }
        //     }
        // },
        'employee[present_address]': {
            validators: {
                notEmpty: {
                    message: 'Address cannot be empty'
                }
            }
        },
        'employee[phone]': {
            validators: {
                notEmpty: {
                    message: 'Phone cannot be empty'
                }
            }
        },
        'employee[email]': {
            validators: {
                notEmpty: {
                    message: 'Email cannot be empty'
                },
                emailAddress: {
                    message: 'The email address is not a valid'
                }
            }
        },
        'employee[educations_attributes][0][institute_name]': {
            validators: {
                notEmpty: {
                    message: 'Institue name cannot be empty'
                }
            }
        },
        'employee[educations_attributes][0][degree]': {
            validators: {
                notEmpty: {
                    message: 'Degree cannot be empty'
                }
            }
        },
        'employee[educations_attributes][0][start_date]': {
            validators: {
                notEmpty: {
                    message: 'Start Date cannot be empty'
                },
                birthday: {
                    message: 'Start Date is not valid'
                }
            }
        },
        'employee[experiences_attributes][0][company]': {
            validators: {
                notEmpty: {
                    message: 'Company cannot be empty'
                }
            }
        },
        'employee[experiences_attributes][0][position]': {
            validators: {
                notEmpty: {
                    message: 'Position Date is not valid'
                }
            }
        },
        'employee[experiences_attributes][0][from_date]': {
            validators: {
                notEmpty: {
                    message: 'From Date cannot be empty'
                },
                birthday: {
                    message: 'From Date is not valid'
                }
            }
        },
        'employee[experiences_attributes][0][to_date]': {
            validators: {
                birthday: {
                    message: 'To Date is not valid'
                }
            }
        },
        'student[school_class_id]': {
            validators: {
                notEmpty: {
                    message: 'Class cannot be empty'
                }
            }
        },
        'student[joining_date]': {
            validators: {
                notEmpty: {
                    message: 'Joining Date cannot be empty'
                },
                birthday: {
                    message: 'Joining Date is not valid'
                }
            }
        },
        'student[first_name]': {
            validators: {
                notEmpty: {
                    message: 'First Name cannot be empty'
                }
            }
        },
        'student[last_name]': {
            validators: {
                notEmpty: {
                    message: 'Last Name cannot be empty'
                }
            }
        },
        'student[date_of_birth]': {
            validators: {
                notEmpty: {
                    message: 'Date of  Birth cannot be empty'
                },
                birthday: {
                    message: 'Joining Date is not valid'
                }
            }
        },
        'student[address]': {
            validators: {
                notEmpty: {
                    message: 'Address cannot be empty'
                }
            }
        },
        'student[gender]': {
            validators: {
                notEmpty: {
                    message: 'Plese select the Gender'
                }
            }
        },
        'student[emergency_contacts_attributes][0][name]': {
            validators: {
                notEmpty: {
                    message: 'Guardian Name cannot be empty'
                }
            }
        },
        'student[emergency_contacts_attributes][0][phone]': {
            validators: {
                notEmpty: {
                    message: 'Guardian contact number cannot be empty'
                }
            }
        }
      }
    })

    .on('success.form.bv', function(e) {
        // Called when the form is valid
        var $form = $(e.target);
        if ($form.data('remote')) {
            e.preventDefault();
            return false;
        }
    })
    .on('submit', function(e) {
        var $form = $(e.target);
        if ($form.data('remote')) {
            var numInvalidFields = $form.data('bootstrapValidator').getInvalidFields().length;
            if (numInvalidFields) {
                e.preventDefault();
                return false;
            }
        }
    });
    

});