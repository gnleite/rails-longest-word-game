require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = (0..10).map { ('A'..'Z').to_a.sample }
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params['word']}"
    verify = JSON.parse(URI.open(url).read)
    if verify['found'] == true
      result = "Congratulations! #{params['word']} is a valid English word!"
    end
    binding.pry
    return result
  end
end
