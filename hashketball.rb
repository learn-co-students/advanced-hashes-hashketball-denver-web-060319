# Write your code here!
require "pry"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

# def num_points_scored(this_player)
#   home_team = game_hash[:home][:players].keys
#   away_team = game_hash[:away][:players].keys
#     if home_team.include?(this_player)
#       game_hash[:home][:players][this_player][:points]
#     else
#       game_hash[:away][:players][this_player][:points]
#     end
# end

#another, more efficient way to do the same as above
def num_points_scored(this_player)
  game_hash.each do |location, team_data|
    if team_data[:players].include?(this_player)
      return team_data[:players][this_player][:points]
    end
  end
end

def shoe_size(this_player)
  game_hash.each do |location, team_data|
    if team_data[:players].include?(this_player)
      return team_data[:players][this_player][:shoe]
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << team_data[:team_name]
  end
  teams
end

def player_numbers(team)
  jersey_nums = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].each do |name, info|
        jersey_nums << info[:number]
      end
    end
  end
  jersey_nums
end

def player_stats(player)
  game_hash.each do |location, team_data|
    if team_data[:players].include?(player)
      return team_data[:players][player]
    end
  end
end

def big_shoe_rebounds
  shoe_size = 0
  num_of_rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |players, stats|
      if stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
        num_of_rebounds = stats[:rebounds]
      end
    end
  end
  shoe_size
  num_of_rebounds
end

def most_points_scored
  points_scored = 0
  player = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |players, stats|
      if stats[:points] > points_scored
        points_scored = stats[:points]
        player = players
      end
    end
  end
  points_scored
  player
end

def winning_team
  nets = 0
  hornets = 0
  game_hash.each do |location, team_data|
    if team_data[:team_name] == "Brooklyn Nets"
      team_data[:players].each do |name, stats|
        nets += stats[:points]
      end
    else
      team_data[:players].each do |name, stats|
        hornets += stats[:points]
      end
    end
  end
  if nets > hornets
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  character_count = 0
  player = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name.length > character_count
        character_count = name.length
        player = name
      end
    end
  end
  player
end

def long_name_steals_a_ton?
  most_steals = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
      end
    end
  end
  if most_steals = player_with_longest_name
    true
  else
    false
  end 
end
