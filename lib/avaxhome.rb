require 'rubygems'
require 'mechanize'

module Avaxhome
  attr_accessor :page_limit, :agent
  URL = "http://avaxhome.ws"
  
  # def initialize(options)
    # if options[:page_limit]
    #   @page_limit = options[:page_limit]
    # else
    #   puts "There is no page limit, so, default is 20"
    #   @page_limit = 20
    # end
  #   
  #  
  # end
  
  def init(options )
    if options[:page_limit]
      @page_limit = options[:page_limit]
    else
      puts "There is no page limit, so, default is 20"
      @page_limit = 20
    end
    @agent = Mechanize.new
    @agent.keep_alive = false;
    @agent.user_agent = "Yahoo Spider"
    @agent.user_agent_alias = "Mac Safari"
    @agent.get(URL)
  end
  
  def start_download(options)
    download_result = []
    init( options )
    page = @agent.page
    page_count = 0
    
    while( page_count < @page_limit) do
      page_data = []
      page.search("div.news").each do |post|
        result =  post.at_css('div.title h1 a')

        title= result.text
        href = result.attribute('href')
        page_data.push( {:title => title, :href => URL + href.to_s})
        puts "Title: #{title}"
        puts "URI= #{URL}#{href}"
        puts "========"*2 + "\n"
      end
      page = next_page(page)
      page_count = page_count + 1

      puts "-----------The next page*********"
      download_result = download_result +  page_data 
    end
    
    download_result
  end
  
  
  def next_page(current_page)
    # search the next page link
    next_link = current_page.search("a.next_page")
    next_page = URL + next_link.attribute("href")
    agent = Mechanize.new
    agent.get(next_page)
    return agent.page
  end
  
end


