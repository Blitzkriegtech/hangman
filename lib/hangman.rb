# frozen_string_literal: true

# Class file that handles all the game flow of hangman
class Hangman
  attr_reader :board, :secret_word, :guessed_letters, :wrong_letters

  def initialize
    @secret_word = []
    @lives = 7
    @guessed_letters = []
    @wrong_letters = []
    @board = []
  end
end
