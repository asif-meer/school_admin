
$(function() {
    $('form').bootstrapValidator({
      feedbackIcons: {
          valid: 'glyphicon glyphicon-ok',
          invalid: 'glyphicon glyphicon-remove',
          validating: 'glyphicon glyphicon-refresh'
      },
      fields: {
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
        'batch[course]': {
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
        'subject[course_id]': {
            validators: {
                notEmpty: {
                    message: 'Course cannot be empty'
                }
            }
        },
        'subject[batch_id]': {
            validators: {
                notEmpty: {
                    message: 'Batch cannot be empty'
                }
            }
        },
        'subject[subject_name]': {
            validators: {
                notEmpty: {
                    message: 'Subject name cannot be empty'
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