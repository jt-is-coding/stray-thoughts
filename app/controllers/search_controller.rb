class SearchController < ApplicationController
  

  def search_home
  end

  def search_results
    @game = Game.new
    @game_list = []
    user_year = params.fetch(:year)

    if user_year.to_i > 2023 || user_year.to_i < 1972
      user_year = rand(1972..2023)
    end

    giant_bomb_url1 = "https://www.giantbomb.com/api/games/?api_key=#{ENV.fetch("GIANT_BOMB_KEY")}&format=json&field_list=id,name,deck,image,platforms&filter=expected_release_year:#{user_year}"
    raw_response = HTTP.get(giant_bomb_url1)
    @parsed_response = JSON.parse(raw_response)
    max_number = @parsed_response.fetch("number_of_total_results")
    max_offset = max_number.to_i - 100
    
    if max_number > 100
      giant_bomb_url2 = "https://www.giantbomb.com/api/games/?api_key=#{ENV.fetch("GIANT_BOMB_KEY")}&format=json&field_list=id,name,deck,image,platforms&offset=#{rand(100..max_offset)}&filter=expected_release_year:#{user_year}"
      raw_response = HTTP.get(giant_bomb_url2)
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
