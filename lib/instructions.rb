# frozen_string_literal: true

# contains set of instructions on how to play the game
module HowToPlay
  # rubocop: disable Metrics/MethodLength
  def instructions
    puts <<~HERDOC
            \n\n---=How to Play Hangman=---
      \nStarting the Game:

      Run the game by executing the main script (e.g., ruby bin/main.rb).
      When prompted at the welcome screen, type s (or start) to begin a new game.

      Game Setup:

      The game randomly selects a secret word from a dictionary file (word.txt).
      The secret word's length is displayed as a series of underscores (one per letter).

      Making a Guess:

      You’ll be prompted to "Please take a guess:" where you must input a single letter (a–z).
      The game will:
      Reveal the letter's position(s) in the secret word if your guess is correct.
      Record your guess as incorrect if the letter isn’t in the word, and decrement your lives.
      Each guess is case-insensitive, so both uppercase and lowercase letters are treated the same.

      Additional Commands:

      Save:

      At any guess prompt, you can type save to save your current game progress.
      The game will write your current state (including the secret word, guessed letters, and remaining lives) to a timestamped file.

      Load:

      Type load to load a previously saved game.
      You’ll be presented with a list of available saves to choose from.
      Exit:
      If you want to quit mid-game, type exit or quit to end the session immediately.

      Game State Display:

      After every guess, the game shows:
      The current state of the secret word with correct guesses filled in.
      A list of incorrect guesses.
      How many lives you have left.

      Game Over:

      Win: If you correctly guess every letter of the secret word before running out of lives, you win.
      Lose: If your lives reach zero before you guess the word, the game is over and the secret word is revealed.
      Resetting the Game:

      Once a game concludes (win or lose), you’ll be asked:
      "Do you want to play again? (Y/N):"
      Enter y to start a new game, or n to exit.

      Tips:

      Input should be a single letter at a time.
      Make sure to double-check your input—if you enter an invalid or repeated letter, you’ll be prompted to try again.
      Use the save/load commands if you need to pause and resume your game later.
      Enjoy playing Hangman and good luck guessing the secret word!
    HERDOC
  end
  # rubocop: enable Metrics/MethodLength
end
