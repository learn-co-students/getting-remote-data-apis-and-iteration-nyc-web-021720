require 'rest-client'
require 'json'
require 'pry'



# def get_character_movies_from_api(character_name)
#   #make the web request
#   response_string = RestClient.get('http://www.swapi.co/api/people/')
#   # parse the data 
#   response_hash = JSON.parse(response_string)

#   results = response_hash["results"] #array of hashes 
 
#   # returns a hash for the character 
#   person = results.find do |hash|
#     hash["name"].downcase == character_name 
#   end

#   while not person do 
#     next_response = RestClient.get(response_hash["next"])
#     next_parse = JSON.parse(next_response)
#     next_results = next_parse["results"]
#     person = next_results.find do |hash|
#       hash["name"].downcase == character_name 
#     end
#   end
  
#   # makes request to each url element and stores values in an array
#   film_collection = person["films"].map do |url|
#     RestClient.get(url)
#   end

#   # creates an array of parsed film hashes 
#   films = film_collection.map do |api|
#     JSON.parse(api)
#   end 

# end
 

# def print_movies(films)
#   films.each do |film|
#     puts film["title"]
#   end
# end


# def show_character_movies(character)
#   films = get_character_movies_from_api(character)
#   print_movies(films)
# end





## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

# using helper methods 


def data_parser(url)
  JSON.parse(RestClient.get(url))
end


def get_character_data(character, parsed_data)
  results = parsed_data["results"]
  person = results.find do |hash|
    hash["name"] == character
  end

  while not person do 
    next_response = data_parser(parsed_data["next"])
    next_results = next_response["results"]
    person = next_results.find do |hash|
      hash["name"] == character 
    end
  end

  person 
end


def get_character_movies_from_api(character, data)
  character_data = get_character_data(character, data)
  films = character_data["films"].map do |url|
    data_parser(url)
  end
end


def print_movies(films)
  films.each do |film|
    puts film["title"]
  end
end


# modified
def show_character_movies(character)
  data = data_parser('http://www.swapi.co/api/people/')
  films = get_character_movies_from_api(character, data)
  print_movies(films)
end



