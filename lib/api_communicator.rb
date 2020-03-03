require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get("http://www.swapi.co/api/people/?search=#{character_name}")
  response_hash = JSON.parse(response_string)["results"]

  films = response_hash[0]["films"]

  films.collect do |film|
    #Getting films JSON hash
    movie_info = RestClient.get(film)
    #parsing the json to ruby
    movie_info_parsed = JSON.parse(movie_info)
    # binding.pry
   end
  # movie_info_parsed
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list

  #   end
  # end
  films.each do |names|
    # binding.pry
    puts names["title"]
  end
  
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end
## BONUS
# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?