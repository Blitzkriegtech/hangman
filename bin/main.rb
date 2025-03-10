# frozen_string_literal: true

require_relative '../lib/hangman'
require_relative '../lib/instructions'
# rubocop: disable Metrics/MethodLength
# Executes hangman
def exe
  loop do
    puts "\n\n-x=WELCOME TO HANGMAN=x-"
    print "\nEnter 's' to start a new game; (h) for how to play; (q) to exit game: "
    input = gets.chomp

    case input
    when 's', 'start', 'S'
      loop do
        game = Hangman.new
        continue = game.play
        break unless continue
      end
      puts "\nThank you for playing! See you next time!"
    when 'h', 'H'
      include HowToPlay
      instructions
    when 'q', 'Q', 'quit', 'exit'
      puts 'Thank you. Have a nice day!'
      exit
    else
      puts "Invalid input. Please enter a valid selection['s', 'h', 'q'].\nTry again."
    end
  end
end
# rubocop: enable Metrics/MethodLength
exe
