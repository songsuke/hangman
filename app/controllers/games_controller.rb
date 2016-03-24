class GamesController < ApplicationController

  def new
    @word = Word.find 2
    game = Game.create(word: @word)
    redirect_to game

  end

  def show
    @game = Game.find params[:id]
    word = @game.word
    letters = word.word.split('')
    @answer = []
    letters.each do |letter|
      @answer << '_'
    end
  end

  def update
    game = Game.find params[:id]
    current_playing = game.current_playing
    game.update current_playing: current_playing + params[:guess]
    letters = game.word.word.split('')
    current_letters = game.current_playing
    answer = []
    win = true
    letters.each do |letter|
      if current_letters.include? (letter)
        answer << letter
      else
        answer << '_'
        win = false
      end
    end

    answer = answer.join(' ')
    respond_to do |format|
      format.html do
        render json: {answer: answer, win: win}
      end
    end
  end

end
