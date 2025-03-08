# frozen_string_literal: true

require_relative 'dump_and_load'
# Class file that handles all the game flow of hangman
# rubocop: disable Metrics/ClassLength
class Hangman
  include SaveLoad
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
    display_game_state

    until game_over?
      guess = valid_guess
      update_board(guess)
      display_game_state
    end
    conclude_game
  end

  private

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
    puts "\nSECRET WORD: #{board.join(' ')}"
  end

  def save_current_game
    manager = SaveLoad::SaveLoadManager.new
    manager.save(self)
    puts "\n\nGame saved successfully!\nResuming game.."
  end

  def load_save_game
    manager = SaveLoad::SaveLoadManager.new
    loaded_game = manager.load_game
    return unless loaded_game

    puts 'Game loaded successfully. Game on...'
    loaded_game.play
    exit
  end

  def display_wrong_letters
    wrong_letters.join(' ')
  end

  # rubocop: disable Metrics/MethodLength
  def valid_guess
    loop do
      print 'Please take a guess: '
      input = gets.chomp.downcase

      # if %w[exit quit].include?(input) then quit_game
      # elsif !input.match?(/\A[a-z]\z/) then puts "Invalid input.\nPlease input a LETTER, 1 at a time."
      # elsif already_guessed?(input) then puts "'#{input} was already used. Pick a NEW ONE!'"
      # else
      #   return input
      # end
      case input
      when 'exit', 'quit', 'QUIT', 'EXIT', 'Quit', 'Exit' then quit_game
      when 'save', 'SAVE', 'Save' then save_current_game
                                       next
      when 'load', 'LOAD', 'Load' then load_save_game
                                       next
      when /\A[a-z]\z/
        return input unless already_guessed?(input)

        puts "'#{input}' was already used. TRY A NEW ONE!"
      else
        puts "Invalid input.\nPlease input a single LETTER, or 'save', or 'load', 'exit' if your like."
      end
    end
  end
  # rubocop: enable Metrics/MethodLength

  def update_board(guess)
    if secret_word.include?(guess)
      secret_word.each_char.with_index { |letter, i| board[i] = letter if letter == guess }
    else
      wrong_letters << guess
      @lives -= 1
    end
    guessed_letters << guess
  end

  def display_game_state
    display_board
    puts "Incorrect guess(es): #{display_wrong_letters}" unless wrong_letters.empty?
    puts "LIVES LEFT: #{@lives}"
  end

  def already_guessed?(letter)
    guessed_letters.include?(letter)
  end

  def game_over?
    @lives.zero? || !board.include?('_')
  end

  def quit_game
    puts "\nThank you for playing!\nBTW the SECRET WORD was: #{secret_word}."
    exit
  end

  def conclude_game
    if @lives.zero?
      puts "\nThank you for playing!\nSadly you lose :(\nSECRET WORD: #{secret_word}"
    else
      puts "YOU WON!\nYou have guessed the SECRET WORD: #{secret_word}"
    end
  end
end
# rubocop: enable Metrics/ClassLength
Hangman.new.play
