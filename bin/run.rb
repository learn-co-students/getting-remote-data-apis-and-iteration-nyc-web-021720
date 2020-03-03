
require_relative '../lib/api_communicator.rb'
require_relative '../lib/command_line_interface.rb'

welcome
character = get_character_from_user
starwars_api = 'http://www.swapi.co/api/people/'
data = data_parser(starwars_api)
films = get_character_movies_from_api(character, data)

show_character_movies(character)