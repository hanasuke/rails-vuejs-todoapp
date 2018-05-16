json.set! :tasks do
  json.array! @tasks do |t|
    json.extract! t, :id, :name, :is_done, :created_at, :updated_at
  end
end
