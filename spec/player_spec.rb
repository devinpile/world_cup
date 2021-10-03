require 'rspec'
require './lib/player'

describe Player do
  before(:each) do
    @player = Player.new({name: "Luka Modric", position: "Midfielder"})
  end

  it 'exists and has readable attributes' do
    expect(@player).to be_a Player
    expect(@player.name).to eq("Luka Modric")
    expect(@player.position).to eq("Midfielder")
  end
end