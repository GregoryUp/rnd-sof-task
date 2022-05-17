json.extract! news, :id, :title, :author, :content, :created_at, :updated_at
json.url news_url(news, format: :json)
