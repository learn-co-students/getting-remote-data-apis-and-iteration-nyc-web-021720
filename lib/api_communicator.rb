require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  star_wars_info = JSON.parse(response_string)
  character_info = star_wars_info["results"]

  character = character_info.find do |property|
    property["name"] == character_name
  end

  film_urls = character["films"]    

  films = film_urls.collect do |url| #iterating over film URLS to return info on that film
    JSON.parse(RestClient.get(url))
  end

  films
end

def print_movies(films)
  films.each_with_index{|data, index| puts "#{index + 1}. " + data["title"]}
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
