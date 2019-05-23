def game_hash
    game_hash = {
        home: {
            team_name: "Brooklyn Nets",
            colors: ["Black", "White"],
            players: {
                "Alan Anderson" => {
                    number: 0,
                    shoe: 16,
                    points: 22,
                    rebounds: 12,
                    assists: 12,
                    steals: 3,
                    blocks: 1,
                    slam_dunks: 1 
                },
                "Reggie Evans" => {
                    number: 30,
                    shoe: 14,
                    points: 12,
                    rebounds: 12,
                    assists: 12,
                    steals: 12,
                    blocks: 12,
                    slam_dunks: 7 
                },
                "Brook Lopez" => {
                    number: 11,
                    shoe: 17,
                    points: 17,
                    rebounds: 19,
                    assists: 10,
                    steals: 3,
                    blocks: 1,
                    slam_dunks: 15 
                },
                "Mason Plumlee" => {
                    number: 1,
                    shoe: 19,
                    points: 26,
                    rebounds: 12,
                    assists: 6,
                    steals: 3,
                    blocks: 8,
                    slam_dunks: 5 
                },
                "Jason Terry" => {
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
                "Jeff Adrien" => {
                    number: 4,
                    shoe: 18,
                    points: 10,
                    rebounds: 1,
                    assists: 1,
                    steals: 2,
                    blocks: 7,
                    slam_dunks: 2 
                },
                "Bismack Biyombo" => {
                    number: 0,
                    shoe: 16,
                    points: 12,
                    rebounds: 4,
                    assists: 7,
                    steals: 7,
                    blocks: 15,
                    slam_dunks: 10 
                },
                "DeSagna Diop" => {
                    number: 2,
                    shoe: 14,
                    points: 24,
                    rebounds: 12,
                    assists: 12,
                    steals: 4,
                    blocks: 5,
                    slam_dunks: 5 
                },
                "Ben Gordon" => {
                    number: 8,
                    shoe: 15,
                    points: 33,
                    rebounds: 3,
                    assists: 2,
                    steals: 1,
                    blocks: 1,
                    slam_dunks: 0 
                },
                "Brendan Haywood" => {
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

def num_points_scored(player_name)
    game_hash.map do |location, team_info|
        team_info[:players].map do |player, details|
            score = details[:points].to_i if player_name == player
        end
    end.flatten.compact.join.to_i
end

def shoe_size(player_name)
    game_hash.map do |location, team_info|
        team_info[:players].map do | name, stats|
                    size = stats[:shoe] if player_name == name
        end
    end.flatten.compact.join.to_i
end

def team_colors(team)
    game_hash.map do |location, team_info|
        team_info[:colors] if team_info[:team_name] == team
    end.compact.flatten
end

def team_names
    game_hash.map do |location, team_info|
        team_info[:team_name]
    end
end

def player_numbers(team)
    game_hash.map do |location, team_info|
        if team_info[:team_name] == team
            team_info[:players].map { |name, details| details[:number].to_i }
        end
    end.flatten.compact
end

def player_stats(player)
    game_hash.map do |location, team_info|
        team_info[:players].map do |players, stats|
            stats if players == player
        end
    end.flatten.compact.first
end

def big_shoe_rebounds
    size = nil
    rebounds = nil
    game_hash.each do |location, team_info|
        team_info[:players].each do |players, stats|
            if size == nil || stats[:shoe] > size
                size = stats[:shoe]
                rebounds = stats[:rebounds]
            end
        end
    end
    rebounds
end

def most_points_scored
    name = nil
    points = nil
    game_hash.each do |location, team_info|
        team_info[:players].each do |players, stats|
            if points == nil || stats[:points] > points
                name = players
                points = stats[:points]
            end
        end
    end
    name
end

def winning_team
    home = ""
    home_points = 0
    away = ""
    away_points = 0
    game_hash.each do |location, team_info|
        if location == :home
            home = team_info[:team_name]
            team_info[:players].each do |players, stats|
                home_points += stats[:points]
            end
        else
            away = team_info[:team_name]
            team_info[:players].each do |players, stats|
                away_points += stats[:points]
            end
        end
    end
    home_points > away_points ? home : away    
end

def player_with_longest_name
    name = nil
    game_hash.each do |location, team_info|
        team_info[:players].each do |players, stats|
            if name == nil || players.length >= name.length
                name = players
            end
        end
    end
    name
end

def long_name_steals_a_ton?
    longest_name = nil
    steals_name = nil
    steals = nil
    game_hash.each do |location, team_info|
        team_info[:players].each do |players, stats|
            if longest_name == nil || players.length >= longest_name.length
                longest_name = players
            end
        end
    end
    game_hash.each do |location, team_info|
        team_info[:players].each do |players, stats|
            if steals == nil || stats[:steals] >= steals
                steals_name = players
                steals = stats[:steals]
            end
        end
    end
    if longest_name == steals_name
        true
    else
        false
    end
end
