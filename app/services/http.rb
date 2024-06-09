require 'net/http'

class Http
  def get(url)
    Net::HTTP.get(URI(url))
  rescue StandardError => e
    { error: "Unable to communicate with the API: #{e.message}" }.to_json
  end
end
