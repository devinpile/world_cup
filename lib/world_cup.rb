class WorldCup
  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year  = year
    @teams = teams
  end

  def active_players_by_position(position)
    apbp = []
    teams.each do |team|
      unless team.eliminated? == true
        team.players.each do |player|
          if player.position == position
            apbp << player
          end
        end
      end
    end
    apbp
  end

  def all_players_by_position
    player_hash = {}
    teams.each do |team|
      team.players.each do |player|
        if player_hash[player.position].nil?
          player_hash[player.position] = [player]
        else player_hash[player.position] << player
        end
      end
    end
    player_hash
  end
end