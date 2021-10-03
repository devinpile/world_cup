require 'rspec'
require './lib/team'
require './lib/player'

describe Team do
  before(:each) do
    @team = Team.new("France")
    @mbappe = Player.new({
      name: "Kylian Mbappe",
      position: "forward"})
    @pogba = Player.new({
      name: "Paul Pogba",
      position: "midfielder"})
  end

  it 'exists' do
    expect(@team).to be_a Team
  end

  it 'has readable attributes' do
    expect(@team.country).to eq("France")
    expect(@team.eliminated?).to be false
    expect(@team.players).to eq([])
  end

  describe '#eliminated' do
    it 'can eliminate a team' do
      @team.eliminated = true
      expect(@team.eliminated?).to be true
    end
  end

  describe '#add_player' do
    it 'can add player' do
      @team.add_player(@mbappe)
      @team.add_player(@pogba)

      expect(@team.players).to eq([@mbappe, @pogba])
    end
  end

  describe '#players_by_position' do
    it 'can return players by position' do
      @team.add_player(@mbappe)
      @team.add_player(@pogba)

      expect(@team.players_by_position('midfielder')).to eq([@pogba])
      expect(@team.players_by_position('defender')).to eq([])
    end
  end
end