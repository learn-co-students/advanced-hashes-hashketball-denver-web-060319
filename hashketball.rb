require "pry"

def game_hash
{
      home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [{name: "Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
                   {name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
                   {name: "Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
                   {name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
                   {name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
                  ]},
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [{name: "Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
                  {name: "Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
                  {name: "DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
                  {name: "Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
                  {name: "Brendan Haywood", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
                ]}
  }
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
      team_data[:players].each do |player|
        if player[:name] == name
          return player[:points]
    end
  end
end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
      team_data[:players].each do |player|
        if player[:name] == name
          return player[:shoe]
    end
  end
end
end

def team_colors(t_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == t_name
      return team_data[:colors]
end
end
end

def team_names
  t_array=[]
  game_hash.each do |location, team_data|
    t_array<< team_data[:team_name]
end
t_array
end

def player_numbers (t_name)
  j_number = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == t_name
      team_data[:players].each do |player|
        j_number << player[:number]
      end
    end
  end
    j_number
  end

  def player_stats (name)
    game_hash.each do |location, team_data|
     team_data[:players].each do |player|
       if player[:name] == name
         player.delete(:name)
         return player
    end
  end
end
end

def big_shoe_rebounds
  shoe = 0
  reb_p = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:shoe] > shoe
        reb_p = player[:rebounds]
      end
    end
  end
  reb_p
end


def most_points_scored
  points = 0
  pnt_p = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:points] > points
        points = player[:points]
        pnt_p = player[:name]
      end
    end
  end
end
