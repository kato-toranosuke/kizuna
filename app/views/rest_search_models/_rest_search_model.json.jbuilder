json.extract! rest_search_model, :id, :name, :mask, :temp, :alcohol, :takeout, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :googlemap, :tabelog, :homepage, :created_at, :updated_at
json.url rest_search_model_url(rest_search_model, format: :json)
