class WordsController < ApplicationController

  def index
    @word = Word.find 2
    @letters = @word.word.split('')
    @answer = []
    @letters.each do |letter|
      @answer << '_'
    end
  end

  def check_guess
    @word = Word.find 2
    @letters = @word.word.split('')
    answer = []
    @letters.each do |letter|
      if params[:guess] == letter
        answer << letter
      else
        answer << '_'
      end

    end
    respond_to do |format|
      format.html do
        render json: answer.join(' ')
      end
    end

  end

end
