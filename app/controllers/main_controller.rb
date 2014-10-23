class MainController < ApplicationController

  def initialize
    @colours = ["red", "pink", "orange", "yellow", "green", "blue", "purple"]

    @rwords = ["man", "mountain", "state", "ocean", "country", "building", "cat", "airline", "wealth", "happiness", "pride", "fear", "religion", "bird", "book", "phone", "rice", "snow", "water"]
  end

  def index

  end

  def results
    # binding.pry
    colour = params["format"]
    rword = @rwords.sample
    @lucky_draw = colour + " & " +rword
  end

end