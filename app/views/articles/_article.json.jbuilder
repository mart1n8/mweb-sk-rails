json.extract! article, :id, :title, :slug, :article_category_id, :tags, :into_text, :text, :created_at, :updated_at
json.url article_url(article, format: :json)
