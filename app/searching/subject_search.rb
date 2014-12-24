class SubjectSearch
	def self.search_subjects(params)
		subject = ""
		if params[:search_by_course] == ""
			subject = Subject.all
			subject = Subject.where("subject_name LIKE ?", "%#{params[:search]}%")
      	elsif params[:search_by_batch] == ""
      		subject = Subject.all
	      	subject = Subject.where("subject_name LIKE ?", "%#{params[:search]}%")
	    elsif params[:search_by_course] && params[:search_by_batch] && params[:search]
			subject = Subject.where("batch_id = ? AND course_id = ? AND subject_name LIKE ?", "#{params[:search_by_batch]}", "#{params[:search_by_course]}", "%#{params[:search]}%")
	    elsif params[:search_by_course] || params[:search] || params[:search]
			subject = Subject.where("batch_id = ? OR course_id = ? OR subject_name LIKE ?", "#{params[:search_by_batch]}", "#{params[:search_by_course]}", "%#{params[:search]}%")
	    else
			subject = Subject.all
	    end
	end
end