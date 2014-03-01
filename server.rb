require 'sinatra'
require 'csv'
require 'pry'

before do
	@roster_info = []
	CSV.foreach('lackp_starting_rosters.csv',headers:true) do |row|
		@roster_info << row.to_hash
	end
end

# CSV.foreach('lackp_starting_rosters.csv', headers: true) do |row|
#     if row["team"].downcase == @heading
#       @players << row.to_hash
#     end
#   end

get '/:team' do
	#binding.pry
	@team_players = []
	@specific_team = params[:team].gsub!(/_/," ") #Jetson Jets
  @roster_info.each do |item|
  	if item['team'] == @specific_team
  		@team_players << item
  	end
  end
  erb :index
end




