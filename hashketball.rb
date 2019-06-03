require 'pry'

def game_hash
    game_hash = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => {
                "Alan Anderson" => {
                    :stats => {
                        :number => 0,
                        :shoe => 16,
                        :points => 22,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 3,
                        :blocks => 1,
                        :slam_dunks => 1
                        }
                    },
                "Reggie Evans" => {
                    :stats => {
                        :number => 30,
                        :shoe => 14,
                        :points => 12,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 12,
                        :blocks => 12,
                        :slam_dunks => 7
                        }
                    },
                "Brook Lopez" => {
                    :stats => {
                        :number => 11,
                        :shoe => 17,
                        :points => 17,
                        :rebounds => 19,
                        :assists => 10,
                        :steals => 3,
                        :blocks => 1,
                        :slam_dunks => 15
                        }
                    },
                "Mason Plumlee" => {
                    :stats => {
                        :number => 1,
                        :shoe => 19,
                        :points => 26,
                        :rebounds => 12,
                        :assists => 6,
                        :steals => 3,
                        :blocks => 8,
                        :slam_dunks => 5
                        }
                    },
                "Jason Terry" => {
                    :stats => {
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
                }
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => {
                "Bismack Biyombo" => {
                    :stats => {
                        :number => 0,
                        :shoe => 16,
                        :points => 12,
                        :rebounds => 4,
                        :assists => 7,
                        :steals => 7,
                        :blocks => 15,
                        :slam_dunks => 10
                        }
                    },
                "DeSagna Diop" => {
                    :stats => {
                        :number => 2,
                        :shoe => 14,
                        :points => 24,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 4,
                        :blocks => 5,
                        :slam_dunks => 5
                        }
                    },
                "Ben Gordon" => {
                    :stats => {
                        :number => 8,
                        :shoe => 15,
                        :points => 33,
                        :rebounds => 3,
                        :assists => 2,
                        :steals => 1,
                        :blocks => 1,
                        :slam_dunks => 0
                        }
                    },
                "Brendan Haywood" => {
                    :stats => {
                        :number => 33,
                        :shoe => 15,
                        :points => 6,
                        :rebounds => 12,
                        :assists => 12,
                        :steals => 22,
                        :blocks => 5,
                        :slam_dunks => 12
                        }
                    },
                "Jeff Adrien" => {
                    :stats => {
                        :number => 4,
                        :shoe => 18,
                        :points => 10,
                        :rebounds => 1,
                        :assists => 1,
                        :steals => 2,
                        :blocks => 7,
                        :slam_dunks => 2
                        }
                    }
                }
        }
    }
    game_hash
end

def num_points_scored(name)
    if game_hash[:home][:players].keys.include?(name)
        points = game_hash[:home][:players][name][:stats][:points]
    elsif game_hash[:away][:players].keys.include?(name)
        points = game_hash[:away][:players][name][:stats][:points]
    else puts "player not in database"
    end
    points
end

def shoe_size(name)
    if game_hash[:home][:players].keys.include?(name)
        game_hash[:home][:players][name][:stats][:shoe]
    elsif game_hash[:away][:players].keys.include?(name)
        game_hash[:away][:players][name][:stats][:shoe]
    else puts "try again"
    end
end

def team_colors(team_name)
    if game_hash[:home][:team_name] == team_name
        game_hash[:home][:colors]
    elsif game_hash[:away][:team_name] == team_name
        game_hash[:away][:colors]
    else puts "try again"
    end
end

def team_names
    array = []
    array << game_hash[:home][:team_name]
    array << game_hash[:away][:team_name]
end

def player_numbers(t_name)
    master_array = []
    if game_hash[:home][:team_name] == t_name
        game_hash[:home][:players].each do |player, stat_hash|
            stat_hash.each do |title, inner_stat_hash|
                inner_stat_hash.each do |key, value|
                    if key == :number
                        master_array << value
                    end
                end
            end
        end
    elsif game_hash[:away][:team_name] == t_name
        game_hash[:away][:players].each do |player, stat_hash|
            stat_hash.each do |title, inner_stat_hash|
                inner_stat_hash.each do |key, value|
                    if key == :number
                        master_array << value
                    end
                end
            end
        end
    else puts "try again"
    end
    master_array
end

def player_stats(name)
    if game_hash[:home][:players].include?(name)
        return game_hash[:home][:players][name][:stats]
    elsif game_hash[:away][:players].include?(name)
        return game_hash[:away][:players][name][:stats]
    end
end

def big_shoe_rebounds
    master = {}
    shoe_bar = 0
    shoe_string = ""
    game_hash[:home][:players].each do |name, stat_hash|
        stat_hash.each do |sta, inner_stat_hash|
            inner_stat_hash.each do |key, value|
                if key == :shoe
                    master[name] = value
                end
            end
        end
    end
    game_hash[:away][:players].each do |name, stat_hash|
        stat_hash.each do |sta, inner_stat_hash|
            inner_stat_hash.each do |key, value|
                if key == :shoe
                    master[name] = value
                end
            end
        end
    end
    master.each do |name, shoe|
        if shoe > shoe_bar
            shoe_bar = shoe
            shoe_string = name
        end
    end

    if game_hash[:home][:players].include?(shoe_string)
        return game_hash[:home][:players][shoe_string][:stats][:rebounds]
    elsif game_hash[:away][:players].include?(shoe_string)
        return game_hash[:home][:players][shoe_string][:stats][:rebounds]
    else 'try again'
    end
end