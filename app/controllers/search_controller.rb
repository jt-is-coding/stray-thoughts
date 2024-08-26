# This logic should be done in a service not in the controller. Potenitally put this logic inside the giant bomb service you created.

class SearchController < ApplicationController

  def index
    authorize :search, :index?
    @game = Game.new
    @game_list = []
    @url = request.original_url.gsub(/[^\w\s]/, '')

    if @url.include?("Search") == true
      user_year = params.fetch(:year)
      if user_year.to_i > 2023 || user_year.to_i < 1972
        user_year = rand(1972..2023)
      end
      giant_bomb_url = "https://www.giantbomb.com/api/games/?api_key=#{ENV.fetch("GIANT_BOMB_KEY")}&format=json&field_list=id,name,deck,image,platforms&filter=expected_release_year:#{user_year}"
      raw_response = HTTP.get(giant_bomb_url)
      if raw_response != nil
        @parsed_response = JSON.parse(raw_response)
        max_number = @parsed_response.fetch("number_of_total_results")
        max_offset = max_number.to_i - 100
        if max_number > 100
          giant_bomb_url = "https://www.giantbomb.com/api/games/?api_key=#{ENV.fetch("GIANT_BOMB_KEY")}&format=json&field_list=id,name,deck,image,platforms&offset=#{rand(100..max_offset)}&filter=expected_release_year:#{user_year}"
          raw_response = HTTP.get(giant_bomb_url)
          @parsed_response = JSON.parse(raw_response)
          @offset = @parsed_response.fetch("offset")
          @results = @parsed_response.fetch("results")
          @results.each do |number|
            @game_list.push(number)
          end
        else
          @results = @parsed_response.fetch("results")
          @results.each do |number|
            @game_list.push(number)
          end
        end
      end
    end
  end

end
