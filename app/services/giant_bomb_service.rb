class GiantBombService
  def initialize(year)
    @year = validate_year(year)
    @api_key = ENV.fetch("GIANT_BOMB_KEY")
    @base_url = "https://www.giantbomb.com/api/games/"
  end

  def fetch_games
    initial_response = fetch_data(@year)
    max_number = initial_response.fetch("number_of_total_results").to_i
    if max_number > 100
      offset = rand(100..(max_number - 100))
      response = fetch_data(@year, offset)
    else
      response = initial_response
    end

    response.fetch("results")
  end

  private

  def validate_year(year)
    year.to_i.between?(1972, 2023) ? year : rand(1972..2023)
  end

  def fetch_data(year, offset = nil)
    url = "#{@base_url}?api_key=#{@api_key}&format=json&field_list=id,name,deck,image,platforms&filter=expected_release_year:#{year}"
    url += "&offset=#{offset}" if offset
    response = HTTP.get(url)
    JSON.parse(response)
  end
end
