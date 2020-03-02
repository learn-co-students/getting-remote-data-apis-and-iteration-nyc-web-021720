def welcome
  # puts out a welcome message here!
  puts "Hello welcome to the Star Wars program...."
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  character_name = gets.chomp.downcase
  puts character_name
end
