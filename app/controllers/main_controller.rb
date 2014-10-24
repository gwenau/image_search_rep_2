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
    api_key = "AIzaSyCWS9V5UF4foe0qsutwad_CU8l8w0RvX3c"
    id = "003846610913805178311:gydxsvhryt4"

    url = "https://www.googleapis.com/customsearch/v1?key="+api_key+"&cx="+id+"&q="+entry+"&alt=json"
    html = HTTParty.get(url)
    @hash = html["items"]
    binding.pry
  end

end