json.extract! game, :id, :title, :image, :platforms, :description, :api_id, :created_at, :updated_at
json.url game_url(game, format: :json)
