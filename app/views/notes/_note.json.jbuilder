json.extract! note, :id, :author_id, :parent_id, :created_at, :updated_at
json.url note_url(note, format: :json)
