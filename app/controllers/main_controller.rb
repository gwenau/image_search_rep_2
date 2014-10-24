class MainController < ApplicationController

  def initialize
    @colours = ["red", "pink", "orange", "yellow", "green", "blue", "purple"]

    @rwords = ["man", "mountain", "state", "ocean", "country", "building", "cat", "airline", "wealth", "happiness", "pride", "fear", "religion", "bird", "book", "phone", "rice", "snow", "water"]
  end

  def index

  end

  def results
    colour = params["format"]
    rword = @rwords.sample
    @lucky_draw = colour + " " + rword
    
    entry = @lucky_draw.gsub(' ', '+')

    key = "uwt42R3XI_GyPY3g-r2USfds"
    id = "215592371804-dbg56b0vg8ocvdoagq28dg66evkn3k0s.apps.googleusercontent.com"
    # url = "http://imgur.com/search/score?q=#{entry}"
    # url = "http://www.apimages.com/Search?query=#{entry}&ss=10&st=kw&entitysearch=&toItem=18&orderBy=Newest"
    # url = "http://www.omdbapi.com/?t=#{entry}"
    url = "https://www.googleapis.com/customsearch/v1?key="+key+"&cx="+id+"&q="+entry+"&alt=json"
    # url = "https://www.googleapis.com/customsearch/v1?key=#{key}&cx=#{id}&q=#{entry}&searchType=image&fileType=jpg&imgSize=small&alt=json"
    binding.pry
    html = HTTParty.get(url)
    # HTTParty is the required software.
    @hash = JSON(html)
    # @hash = html
  end

end