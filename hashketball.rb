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

  # now go back into the hash and find the player with that max shoe size.
  #####################################################################

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

### BONUS QUESTIONS ###########################

def most_points_scored

  # overall: we could replicate big_shoe_rebounds, but no. Let's try something new.
  # New methodology: store the name and points as we go.

  # In order to do this, we need to do a single iteration over the entire
  # nested hash. (previous methods contained a :home and :away iteration.)

  # 1.. spend some time getting more familiar with nested hash iteration.

  # 2.. create two arrays; one for the name of the player with the most points
  # And another for the value of that player's points scored.

  # The starting value for those arrays is just the first player and their
  # associated points scored.

  # How do you find the "initial" of anything in a hash if that term doesn't exit?
  # Do I HAVE to convert the hash into an array? There must be a work-around.
  # All I want is to grab the first person's name... then I can
  # access their points using bracket method and be on my way.
  # Ah-hah! what if I return an array of keys and choose the [0]. Bam.

  # 3. iterate down into the array and push point values and the associated
  # names if the value is greater.

  # 4. return points_leader[0].


points_leader = []
points_leader.push(game_hash[:home][:players].keys[0])
highest_point_total = []
highest_point_total.push(game_hash[:home][:players][points_leader[0]][:points])
  game_hash.each do |team_location, full_team_data_hash|
    full_team_data_hash.each do |team_attribute_keys, team_attribute_data_lists|
      if team_attribute_keys == :players
        team_attribute_data_lists.each do |player_name, player_stats_hash|
          player_stats_hash.each do |individual_stat, stat_value|
            if individual_stat == :points
              if stat_value > highest_point_total[0]
                highest_point_total.pop
                highest_point_total.push(stat_value)
                points_leader.unshift(player_name.to_s)
              end
            end
          end
        end
      end
    end
  end
points_leader[0]
end

def winning_team
home_team_points = []
away_team_points = []
    game_hash[:home][:players].each do |player_name, player_stats|
      player_stats.each do |stat_name, stat_value|
        if stat_name == :points
          home_team_points.push(stat_value)
        end
      end
    end
    game_hash[:away][:players].each do |player_name, player_stats|
      player_stats.each do |stat_name, stat_value|
        if stat_name == :points
          home_team_points.push(stat_value)
        end
      end
    end
  if home_team_points.sum > away_team_points.sum
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end
end

def player_with_longest_name
  long_name_haver = []
  long_name_haver.push(game_hash[:home][:players].keys[0])
  long_name_length = game_hash[:home][:players].keys[0].length
  game_hash.each do |team_location, full_team_data_hash|
    full_team_data_hash.each do |team_attribute_keys, team_attribute_data_lists|
      if team_attribute_keys == :players
        team_attribute_data_lists.each do |player_name, player_stats_hash|
          if player_name.to_s.length > long_name_haver[0].length
            long_name_haver.unshift(player_name)
            long_name_length = player_name.to_s.length
          end
        end
      end
    end
  end
  long_name_haver[0].to_s
end

def long_name_steals_a_ton?

# In the end, we want a comparison of player_with_longest_name and person with
# the most steals.

# plan: replicate the most_points_scored method for most_steals, then call
# the player_with_longest_name method and compare those values.

  steals_leader = []
  steals_leader.push(game_hash[:home][:players].keys[0])
  most_steals = []
  most_steals.push(game_hash[:home][:players][steals_leader[0]][:steals])
    game_hash.each do |team_location, full_team_data_hash|
      full_team_data_hash.each do |team_attribute_keys, team_attribute_data_lists|
        if team_attribute_keys == :players
          team_attribute_data_lists.each do |player_name, player_stats_hash|
            player_stats_hash.each do |individual_stat, stat_value|
              if individual_stat == :steals
                if stat_value > most_steals[0]
                  most_steals.pop
                  most_steals.push(stat_value)
                  steals_leader.unshift(player_name.to_s)
                end
              end
            end
          end
        end
      end
    end

  longest_name = player_with_longest_name

  if longest_name == steals_leader[0]
    return true
  else
    nil
  end

end
