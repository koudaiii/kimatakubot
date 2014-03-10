json.array!(@releases) do |release|
  json.extract! release, :id, :title, :description, :release_at
  json.url release_url(release, format: :json)
end
