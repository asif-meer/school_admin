class SubjectSearch
	def self.search_subjects(params)
		subject = ""
		if params[:search_by_course_in_subjects] == ""
	      subject = Subject.all
      	elsif params[:search_by_batch_in_subjects] == ""
      		subject = Subject.where("course_id = ?", "#{params[:search_by_course_in_subjects]}")
	    elsif params[:search_by_course_in_subjects] && params[:search_by_batch_in_subjects]
	      subject = Subject.where("batch_id = ? AND course_id = ?", "#{params[:search_by_batch_in_subjects]}", "#{params[:search_by_course_in_subjects]}")
	    elsif params[:search_by_course_in_subjects] || params[:search_by_batch_in_subjects]
	      subject = Subject.where("batch_id = ? OR course_id = ?", "#{params[:search_by_batch_in_subjects]}", "#{params[:search_by_course_in_subjects]}")
	    else
	      subject = Subject.all
	    end
	end
end