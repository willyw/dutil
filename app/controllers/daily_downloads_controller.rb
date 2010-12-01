class DailyDownloadsController < ApplicationController
  before_filter :require_user
=begin
  home_page =>  page to be shown to the user if he is logged in
                The logged in user can access all the utilities from the home page
  welcome_page => page for the unlogged in user
                  It shows the feature + benefit of DailyDownload
=end
  def index
    if current_user
      render_home_page
    else
      render_welcome_page
    end
  end
  
  def create
    time = Time.parse( params[:date][:hour] + ":" + params[:date][:minute] )
    time_utc = time.utc.hour.to_s  + ":" + time.utc.min.to_s
    @daily_download = DailyDownload.create(
        :read_time => Time.parse( time_utc ),
        :user => current_user, 
        :title => params[:daily_download][:title]
    )
    
    if @daily_download
      redirect_to daily_download_url( @daily_download )
    else
      redirect_to "http://www.google.com" # this is the error page. change this later
    end
     
  end
  
  
  def render_home_page
    @daily_download = DailyDownload.new
    @daily_downloads = DailyDownload.all
    render :layout => "application", :file => "/daily_downloads/index.html.erb"
  end
  
  def render_welcome_page
    render :layout => "application", :file => "/daily_downloads/welcome.html.erb"
  end
end
