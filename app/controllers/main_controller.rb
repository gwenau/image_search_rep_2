class MainController < ApplicationController

  def initialize
    @colours = ["red", "pink", "orange", "yellow", "green", "blue", "purple"]

    @rwords = ["man", "mountain", "state", "ocean", "country", "building", "cat", "airline", "wealth", "happiness", "pride", "fear", "religion", "bird", "book", "phone", "rice", "snow", "water"]
  end

  def index

  end

  # def results(colour)
  #   binding.pry
  #   @colour = colour
  # end

  def results
    # binding.pry
    @colour = params["format"]
  end

end