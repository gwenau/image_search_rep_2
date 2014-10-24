class MainController < ApplicationController

  def initialize
    @colours = ["red", "pink", "orange", "yellow", "green", "blue", "purple"]
    @rwords = ["man", "mountain", "state", "ocean", "country", "building", "cat", "airline", "wealth", "happiness", "pride", "fear", "religion", "bird", "book", "phone", "rice", "snow", "water"]
  end

  def results
    colour = params["format"]
    rword = @rwords.sample
    @lucky_draw = colour + " " + rword
    
    entry = @lucky_draw.gsub(' ', '+')
    # api_key = "AIzaSyCWS9V5UF4foe0qsutwad_CU8l8w0RvX3c" # gwenau08
    # id = "003846610913805178311:gydxsvhryt4" #gwenau08

    api_key = "AIzaSyBqoZ-SBdyqfayjnfKX0XPvl55b6R1NK20"
    gcse_id = "010147666231756631346:si888rngvei"

    url = "https://www.googleapis.com/customsearch/v1?key="+api_key+"&cx="+gcse_id+"&q="+entry+"&alt=json"
    html = HTTParty.get(url)
    @hash = html["items"][0..4]
    time = Time.now.getutc.to_s
    # Ruby has a method called benchmark to record response time but i can not work out how to use it properly by myself at this stage.

    @past_search_results = []
    # The unshift method was used here as a possible alternative to the Ruby sort or sort_by method.
    @past_search_results.unshift({time: time, colour: colour, noun: rword, input: @hash})
  end

  def past
    @past_search_results
  end

end