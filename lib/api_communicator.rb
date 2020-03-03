require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  # response_hash.downcase

  person_list = response_hash["results"]
  person_list.each do |person|

    if person["name"].downcase == character_name
      puts "\n#{character_name} was in the following movies:"
      return person["films"]
    else 
      puts "We were unable to locate #{character_name}"
    end 
  end 
  
  # "hi"
end

def correct_case(character_name)
  newchar = character_name.split(/ |\_/).map(&:capitalize).join(" ")
  newchar
end 

def print_movies(films)
  films.each do |film_url|
    response_string = RestClient.get(film_url)
    response_hash = JSON.parse(response_string)
      puts response_hash["title"]
  end 


end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
