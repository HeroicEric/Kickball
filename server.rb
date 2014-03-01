require 'sinatra'
require 'csv'
require 'pry'

before do
	@roster_info = []
	CSV.foreach('lackp_starting_rosters.csv',headers:true) do |row|
		@roster_info << row.to_hash
	end
	binding.pry
end

get '/:team'
	binding.pry
	@team_players = []
	@specific_team = params[:team].gsub!(/_/," ") #Jetson Jets
  @roster_info.each do |item|
  	if item['team'] == @specific_team
  		@team_players << #some hash that has first_name, last_name, and position
  	end
  end
  erb :index
end




