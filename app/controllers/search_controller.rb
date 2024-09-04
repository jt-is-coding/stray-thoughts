class SearchController < ApplicationController

  def index
    authorize :search, :index?
    @game = Game.new
    @game_list = []
    @url = request.original_url.gsub(/[^\w\s]/, '')

    if @url.include?("Search") == true
      user_year = params.fetch(:year)
      giant_bomb_service = GiantBombService.new(user_year)
      @game_list = giant_bomb_service.fetch_games
    end
  end
  
end
