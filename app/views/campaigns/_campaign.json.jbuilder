json.extract! campaign, :id, :start, :end, :name, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
