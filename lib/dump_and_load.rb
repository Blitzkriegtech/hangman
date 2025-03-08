# frozen_string_literal: true

require 'yaml'
require 'time'
# Save and Load manager module
module SaveLoad
  # Manages saving and loading of game state
  class SaveLoadManager
    SAVE_DIR = 'saves' # Directory where all the saved files are restored

    # Serialization
    def save(game_state)
      ensure_save_dir
      filename = generate_filename
      File.write(filename, YAML.dump(game_state))
      puts "Game saved to #{filename}"
    end

    # rubocop: disable Metrics/MethodLength
    # Deserialization
    # Loads a game state from a selected save file
    def load_game(file = nil)
      saves = list_saves
      if saves.empty?
        puts 'No saved games found.'
        nil
      end

      file ||= select_save(saves)
      if file && File.exist?(file)
        YAML.safe_load(File.read(file), permitted_classes: [Hangman])
      else
        puts 'Invalid save file selected.'
      end
    end

    private

    # Allows the player to select which saved file to load
    def select_save(saves)
      puts "\nAvailable saves:"
      saves.each_with_index { |save, index| puts "#{index + 1}. #{File.basename(save)}" }
      print "\nChoose a save file to load: "
      input = gets.chomp.to_i
      index = input - 1
      if index >= 0 && index < saves.size
        saves[index]
      else
        puts 'Invalid selection.'
        nil
      end
    end
    # rubocop: enable Metrics/MethodLength

    def list_saves
      Dir.glob(File.join(SAVE_DIR, 'save_*.yaml')).sort
    end

    # Checks and ensures save file directory before dumping
    def ensure_save_dir
      Dir.mkdir(SAVE_DIR) unless Dir.exist?(SAVE_DIR)
    end

    # Creates timestamp before generating a filename
    def generate_filename
      timestamp = Time.now.strftime('%Y-%m-%d**%H_%M_%S')
      File.join(SAVE_DIR, "save_#{timestamp}.yaml")
    end
  end
end
