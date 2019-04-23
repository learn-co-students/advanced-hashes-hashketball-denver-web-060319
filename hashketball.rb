require 'pry'

def game_hash

  nested_game_hash = {

    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson": {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans": {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez": {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee": {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry": {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien": {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo": {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop": {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon": {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood": {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end


def big_shoe_rebounds
  array_of_shoe_sizes = []
    game_hash[:home][:players].each do |name, specific_data|
      specific_data.each do |specific_data, value|
        if specific_data == :shoe
          array_of_shoe_sizes.push(value)
        end
      end
    end

    game_hash[:away][:players].each do |name, specific_data|
      specific_data.each do |specific_data, value|
        if specific_data == :shoe
          array_of_shoe_sizes.push(value)
        end
      end
    end

  max_shoe_size = array_of_shoe_sizes.max # successfully identified largest shoe size.

  # now go back into the hash and find the player with that shoe size.
  #####################################################################
  # in progress work below..

  big_shoe_guy = []

  game_hash[:home][:players].each do |name, attributes|
    attributes.each do |attribute_name, value|
      if attribute_name == :shoe && value == max_shoe_size
        big_shoe_guy.push(name)
      end
    end
  end

  game_hash[:away][:players].each do |name, attributes|
    attributes.each do |attribute_name, value|
      if attribute_name == :shoe && value == max_shoe_size
        big_shoe_guy.push(name)
      end
    end
  end

  game_hash[:home][:players][big_shoe_guy[0]][:rebounds]

end

def num_points_scored(player_name)
  if game_hash[:home][:players].has_key?(player_name.intern) == true
    game_hash[:home][:players][player_name.intern][:points]
  elsif game_hash[:away][:players].has_key?(player_name.intern) == true
    game_hash[:away][:players][player_name.intern][:points]
  else
    game_hash
  end
end


def shoe_size(player_name)
  if game_hash[:home][:players].has_key?(player_name.intern) == true
    game_hash[:home][:players][player_name.intern][:shoe]
  elsif game_hash[:away][:players].has_key?(player_name.intern) == true
    game_hash[:away][:players][player_name.intern][:shoe]
  else
    game_hash
  end
end

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team_name
    game_hash[:away][:colors]
  else
    return nil
  end
end

def team_names
  team_name_array = []
  team_name_array.push(game_hash[:home][:team_name])
  team_name_array.push(game_hash[:away][:team_name])
  team_name_array
end

def player_numbers(team_name)

  jersey_array = []
  player_name_array_home = game_hash[:home][:players].keys
  player_name_array_away = game_hash[:away][:players].keys

    ## Brooklyn Nets
    if game_hash[:home][:team_name] == team_name
      player_name_array_home.each do |player_name|
        jersey_array.push(game_hash[:home][:players][player_name][:number])
        end
    ## Charlotte Hornets
    elsif game_hash[:away][:team_name] == team_name
      player_name_array_away.each do |player_name|
        jersey_array.push(game_hash[:away][:players][player_name][:number])
        end
    end
  jersey_array
end

def player_stats(player_name)

  if game_hash[:home][:players].has_key?(player_name.intern) == true
      game_hash[:home][:players][player_name.intern]
  elsif game_hash[:away][:players].has_key?(player_name.intern) == true
      game_hash[:away][:players][player_name.intern]
  end
end
