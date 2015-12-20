json.array!(@thread_contents) do |thread_content|
  json.extract! thread_content, :id, :content, :topic_id
  json.url thread_content_url(thread_content, format: :json)
end
