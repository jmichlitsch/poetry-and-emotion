class SearchController < ApplicationController
  def index
    conn = Faraday.new('https://poetrydb.org')
    response = conn.get("/author/#{params[:author]}")
    json = JSON.parse(response.body, symbolize_names: true)
    @poems = json.first(10).map do |poem|
      Poem.new(poem)
    end

    @poems.each do |poem|
      conn2 = Faraday.new("https://api.us-south.tone-analyzer.watson.cloud.ibm.com") do |connection|
      connection.headers['Authorization'] = 'Basic iqzibB-9xff-tEfplO7TOZG0APo68rFqVjNz0akxs6ZY'
    end

    response2 = conn2.get("instances/c60d26b6-cc0b-4da7-b2b0-b142638d9672/v3/tone") do |req|
        req.params['version'] = '2017-09-21'
        req.params['text'] = poem.lines
      end
      json2 = JSON.parse(response2.body, symbolize_names: true)
      poem.tone = json2[:document_tone][:tones][0][:tone_name]

    end
  end
end
