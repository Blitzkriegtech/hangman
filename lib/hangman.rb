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

  def play
    puts "\nWelcome to HANGMAN! >_<"
    puts "Newgame commence...\nSECRET WORD has #{secret_word.size} letters."
  end

  def parse_txt
    File.open('word.txt', 'r') do |file|
      file.each_line.with_object([]) do |word, arr|
        stripped_word = word.strip
        arr << stripped_word if (5..12).include?(stripped_word.size) && stripped_word.match?(/\A[a-z]+\z/)
      end
    end
  end
end

Hangman.new.parse_txt
