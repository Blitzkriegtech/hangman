# frozen_string_literal: true

# Class file that handles all the game flow of hangman
class Hangman
  attr_reader :board, :secret_word, :guessed_letters, :wrong_letters

  def initialize
    @secret_word = gen_secret_word
    @lives = 7
    @guessed_letters = []
    @wrong_letters = []
    @board = setup_board
  end

  def play
    puts "\nWelcome to HANGMAN! >_<"
    puts "\nGame commencing...\nSECRET WORD has #{secret_word.size} letters."
    display_board
  end

  def parse_txt
    File.open('word.txt', 'r') do |file|
      file.each_line.with_object([]) do |word, arr|
        stripped_word = word.strip
        arr << stripped_word if (5..12).include?(stripped_word.size)
      end
    end
  end

  def gen_secret_word
    words = parse_txt
    raise 'No valid words in dictionary!' if words.empty?

    words.sample.downcase
  end

  def setup_board
    Array.new(secret_word.size, '_')
  end

  def display_board
    puts board.join(' ')
  end

  def display_wrong_letters
    wrong_letters.join('')
  end

  def valid_guess
    loop do
      print 'Please take a guess: '
      input = gets.chomp.downcase

      if %w[exit quit].include?(input) then quit_game
      elsif !input.match?(/\A[a-z]\z/) then puts "Invalid input.\nPlease input a LETTER, 1 at a time."
      elsif already_guessed?(input) then puts "'#{input} was already used. Pick a NEW ONE!'"
      else
        return input
      end
    end
  end

  def already_guessed?(letter)
    guessed_letters.include?(letter)
  end

  def quit_game
    puts "Thank you for playing!\nBTW the SECRET WORD was: #{secret_word}."
    exit
  end
end
Hangman.new.play
