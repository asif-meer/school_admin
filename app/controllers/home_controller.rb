class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :bootstrap_form_test]


  def index
  end

  def bootstrap_form_test
    
  end


  def settings
    
  end


  # def log
  #   # logger.debug params
  #   # e = Event.new(
  #   #   :event_type => params[:event_type] || 3,  #Javscript event
  #   #   :title => params[:title],
  #   #   :details => params[:details],
  #   #   :occurred_at => params[:occurred_at] || Time.now.utc,
  #   #   :user => current_user,
  #   #   :level => params[:level],
  #   #   :data1 => params[:data1],
  #   #   :data2 => params[:data2],
  #   #   :data3 => params[:data3]

  #   #   )
  #   # e.save
  #   # render json: [], status: :created

  #   event = {
  #     :event_type => params[:event_type] || 3,  #Javscript event
  #     :title => params[:title],
  #     :details => params[:details],
  #     :occurred_at => params[:occurred_at] || Time.now.utc,
  #     :user => current_user,
  #     :level => params[:level],
  #     :data1 => params[:data1],
  #     :data2 => params[:data2],
  #     :data3 => params[:data3]
  #   }
  #   $redis.rpush "events", event.to_json
  #   render json: [], status: :created

  # end

  # def logEvent
  #   # e = Event.new(
  #   #   :event_type => 3,
  #   #   :title => params[:title].capitalize,
  #   #   :details => params[:details].capitalize,
  #   #   :occurred_at => params[:occurred_at] || Time.now.utc,
  #   #   :user => current_user,
  #   #   :level => "DEBUG"
  #   #   )
  #   # e.save
  #   # render json: [], status: :created

  #   event = {
  #     :event_type => 3,
  #     :title => params[:title].capitalize,
  #     :details => params[:details].capitalize,
  #     :occurred_at => params[:occurred_at] || Time.now.utc,
  #     :user => current_user,
  #     :level => "DEBUG"
  #   }
  #   $redis.rpush "events", event.to_json
  # end

  # def logException
  #   # e = Event.new(
  #   #   :event_type => 6,
  #   #   :title => params[:title].capitalize,
  #   #   :details => params[:details].capitalize,
  #   #   :occurred_at => params[:occurred_at] || Time.now.utc,
  #   #   :user => current_user,
  #   #   :level => "ERROR"
  #   #   )
  #   # e.save
  #   # render json: [], status: :created

  #   event = {
  #     :event_type => 6,
  #     :title => params[:title].capitalize,
  #     :details => params[:details].capitalize,
  #     :occurred_at => params[:occurred_at] || Time.now.utc,
  #     :user => current_user,
  #     :level => "ERROR"
  #   }
  #   $redis.rpush "events", event.to_json
  # end

  # def redis
  #   @events = $redis.lrange("events",0,-1).reverse
  #   @events = @events.map{|x| JSON.parse(x) }
  # end
  
  # def events
  #   #@events_list = @events.smembers
  #   @events_list = @events
  # end
end
