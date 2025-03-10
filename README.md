# HANGMAN GAME

Hangman command-line version game made with pure RUBY: Try to guess a secret word one letter at a time. The game includes features for saving and loading your progress, so you can pause and resume your game at any time.

## How to Play

### 1. Starting the Game
- Run the game by executing the main script:
  ```bash
  ruby bin/main.rb
  ```
- At the welcome screen, type **s** or **start** to begin a new game.

### 2. Game Setup
- The game randomly selects a secret word from a dictionary file (`word.txt`).
- The secret word is displayed as underscores (`_`), one for each letter.

### 3. Making a Guess
- When prompted, input a single letter (a–z). Input is **case-insensitive**.
- If your guess is correct, the letter is revealed in its proper position(s) within the secret word.
- If your guess is incorrect, the letter is added to the list of wrong guesses, and you lose a life.

### 4. Additional Commands
- **Save:**  
  At any guess prompt, type `save` to save your current game progress. The game state is saved to a timestamped file.
- **Load:**  
  Type `load` to load a previously saved game. You will be presented with a list of available save files to choose from.
- **Exit:**  
  Type `exit` or `quit` to immediately end the game.

### 5. Game State Display
After every guess, the game displays:
- The current state of the secret word (with correctly guessed letters filled in).
- A list of incorrect guesses.
- The number of lives remaining.

### 6. Game Over
- **Win:**  
  You win if you correctly guess every letter of the secret word before running out of lives.
- **Lose:**  
  If you run out of lives before guessing the word, the game is over and the secret word is revealed.

### 7. Resetting the Game
- After a game concludes (win or lose), you will be asked:
  ```
  Do you want to play again? (Y/N):
  ```
- Enter `y` to start a new game or `n` to exit.

## Additional Tips
- **Input:** Always input a single letter at a time. Repeated or invalid inputs will prompt you to try again.
- **Saving/Loading:** Use the save/load commands if you need to pause and resume your game later.

Enjoy playing Hangman and good luck guessing the secret word!

---