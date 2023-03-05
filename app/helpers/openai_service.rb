require 'faraday'
require 'json'

class OpenaiService
  API_URL = "https://api.openai.com/v1"

  def initialize
    @api_key = ENV["CHATGPT_API_KEY"]
    @conn = Faraday.new(url: API_URL) do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
      faraday.headers['Authorization'] = @api_key
    end
  end

  def generate_text(prompt)
    response = @conn.post do |req|
      req.url 'https://api.openai.com/v1/completions'
      req.headers['Content-Type'] = 'application/json'
      req.body = {
        prompt: prompt,
        max_tokens: 600,
        n: 1,
        stop: nil,
        temperature: 0.7,
        model: 'text-davinci-003'
      }.to_json
    end

    JSON.parse(response.body)
  end
end
