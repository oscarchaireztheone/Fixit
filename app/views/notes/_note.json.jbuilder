json.extract! note, :id, :note_content, :phone_number, :call_id, :status, :created_at, :updated_at
json.url note_url(note, format: :json)
