require "json"
require "open-uri"
class GamesController < ApplicationController


  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    words_serialized = URI.open(url).read
    my_word = JSON.parse(words_serialized)

    @new_word = my_word["found"]

    if @new_word && @word.chars.all? { |letter| @letters.include?(letter) }
      @result = "congratulations!#{@word} is a valid english word and its on the grid"
    else
      @result = "congratulations!#{@word} is NOT a valid english word or its not on the grid"
    end
    # puts "#{user["name"]} - #{user["bio"]}"
  end
end
