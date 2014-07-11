json.array!(@groups) do |group|
  json.extract! group, :id, :uid
  json.url group_url(group, format: :json)
end
