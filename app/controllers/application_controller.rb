class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # layout 'external'
  protect_from_forgery with: :exception
  # before_filter :log_controller_event
  add_breadcrumb "Dashboard", :root_path, :options => { :title => "Home" }
  # before_filter :log_controller_error

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to root_path
    end
  end

  

  # def log_controller_event
  #   return if params[:controller].include? "admin"
  #   # e = Event.new(
  #   #   :event_type => 2,
  #   #   :title => params[:controller].capitalize,
  #   #   :details => params[:action].capitalize,
  #   #   :occurred_at => Time.now.utc,
  #   #   :user => current_user,
  #   #   :level => "DEBUG"
  #   #   )
  #   # e.save
  #   event = {
  #     :event_type => 2,
  #     :title => params[:controller].capitalize,
  #     :details => params[:action].capitalize,
  #     :occurred_at => Time.now.utc,
  #     :user => current_user,
  #     :level => "DEBUG"
  #   }
  #   $redis.rpush "events", event.to_json
  # end

  # def log_controller_error(params={}, data1=nil, data2=nil, data3=nil)
  #   # e = Event.new(
  #   #   :event_type => 4,
  #   #   :title => params[:controller].capitalize,
  #   #   :details => params[:action].capitalize,
  #   #   :occurred_at => Time.now.utc,
  #   #   :user => current_user,
  #   #   :level => "ERROR",
  #   #   :data1 => data1,
  #   #   :data2 => data2,
  #   #   :data3 => data3
  #   #   ) 
  #   # e.save
  #   # logger.error "#{e.title} #{e.details} #{data1} #{data2} #{data3}"
  #   event = {
  #     :event_type => 4,
  #     :title => params[:controller],
  #     :details => params[:action],
  #     :occurred_at => Time.now.utc,
  #     :user => current_user,
  #     :level => "ERROR",
  #     :data1 => data1,
  #     :data2 => data2,
  #     :data3 => data3
  #   }
  #   $redis.rpush "events", event.to_json
  # end

  def current_admin_user
    return nil if user_signed_in? && !current_user.super_admin?
    current_user
  end

  # def after_sign_in_path_for(resource_or_scope)
  #   if resource_or_scope.is_a?(User)
  #     if resource_or_scope.super_admin?
  #       admin_dashboard_path
  #     else
  #       root_path
  #     end
  #   else
  #     super
  #   end
  # end


end
