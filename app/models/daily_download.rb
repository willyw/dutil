require 'avaxhome'
class DailyDownload < ActiveRecord::Base
  include Avaxhome
  
  def download
    start_download(:page_limit => self.page_limit)
  end
  
end
