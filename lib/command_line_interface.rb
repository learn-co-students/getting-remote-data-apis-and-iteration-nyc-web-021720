def welcome
  puts "\nWelcome to the Star Wars program...\nYou can search what movies a character appeared." 
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  character_name = gets.chomp
  # .downcase.strip 
  # puts "You selected #{character_name}!"
end

