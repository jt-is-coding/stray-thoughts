# Is this being used? If so where is this being called?

class GiantBombService
  BASE_URL = "https://www.giantbomb.com/api/games"

  def call
    url = BASE_URL + "?" + params.to_query
    raw_response = HTTP.get(url)
    parsed_response = JSON.parse(raw_response)

    parsed_response.fetch("results")
  end

  private

  def params
    {
      api_key: api_key,
      format: "json",
      field_list: "id,name,deck,image,platforms",
      # filter: "expected_release_year:#{year}",
      # offset: rand(100..max_offset
    }
  end

  def api_key
    ENV.fetch("GIANT_BOMB_KEY")
  end
end
