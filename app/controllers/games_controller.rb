require "open-uri"
class GamesController < ApplicationController
  def new
    @letters = []

    10.times do |letter|
      letter = random_letter = ('a'..'z').to_a.sample
      @letters << letter
    end
  end

  def score
    word = (params[:word]).upcase.strip
    url = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    @words = JSON.parse(url.read)
    @words["found"]
  end

end
