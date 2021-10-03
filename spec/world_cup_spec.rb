require 'rspec'
require './lib/team'
require './lib/player'
require './lib/world_cup'

describe WorldCup do
  before(:each) do
    @france = Team.new("France")
    @croatia = Team.new("Croatia")
    @mbappe = Player.new({
      name: "Kylian Mbappe",
      position: "forward"})
    @pogba = Player.new({
      name: "Paul Pogba",
      position: "midfielder"})
    @modric = Player.new({
      name: "Luka Modric",
      position: "midfielder"})
    @vida = Player.new({
      name: "Domagoj Vida",
      position: "defender"})
    @world_cup = WorldCup.new(2018, [@france, @croatia])

    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)
  end

  it 'has readable attributes' do
    expect(@world_cup.year).to eq(2018)
    expect(@world_cup.teams).to eq([@france, @croatia])
  end

  describe '#active_players_by_position' do
    it 'can return active players by position' do
      expect(@world_cup.active_players_by_position('midfielder')).to eq([@pogba, @modric])
      @croatia.eliminated = true

      expect(@world_cup.active_players_by_position('midfielder')).to eq([@pogba])
    end
  end

  describe '#all_players_by_position' do
    it 'can return all players by position' do
      expected = {
        'forward': [@mbappe],
        'midfielder': [@pogba, @modric],
        'defender': [@vida]
      }
      expect(@world_cup.all_players_by_position).to eq(expected)
    end
  end
end