require 'sinatra'
require 'csv'

before do
  @roster_info = []
  CSV.foreach('lackp_starting_rosters.csv',headers:true) do |row|
    @roster_info << row.to_hash
  end
end

get '/:team' do
  @team_players = []
  @specific_team = params[:team].gsub!(/_/," ") #Jetson Jets
  @roster_info.each do |item|
    if item['team'] == @specific_team
      @team_players << item
    end
  end
  erb :index
end

get '/:position' do
  @player_positions = []
  @specific_position = params[:position].gsub!(/_/," ")
  @roster_info.each do |item|
    if item['position'] == @specific_position
      @player_positions << item
    end
  end
  erb :positions
end
