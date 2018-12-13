json.extract! meteorite, :id, :name, :meteorite_class, :mass, :year, :latitude, :longitude, :created_at, :updated_at
json.url meteorite_url(meteorite, format: :json)
