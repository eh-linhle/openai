require "net/http"
require 'uri'
require 'json'
require_relative '../exceptions/exception'

module OpenAI

  class RestClient

    OPENAI_API_BASEURL = "https://api.openai.com/v1"

    def initialize(api_key)
      @api_key = api_key
    end

    def call_get(url_path, params = {}, headers = default_headers)
      # 1. Encode the parameters for inclusion in the URL
      encoded_params = URI.encode_www_form(params)

      # 2. Create URL
      url = OPENAI_API_BASEURL + url_path

      # 3. Combine the base URL and encoded parameters
      full_url = "#{url}?#{encoded_params}"

      # 4. Create a URL object from the full URL
      uri = URI(full_url)

      # 5. Create a new HTTP GET request
      http = Net::HTTP::Get.new(uri, headers)

      # 6. Send the request and get the response
      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http_|
        http_.request(http)
      end

      # 7. Check for response
      if response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body)
      else
        raise OpenAPIException.new(JSON.parse(response.body)['error'])
      end
    end

    private
    def default_headers
      {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{@api_key}",
        'OpenAI-Beta' => 'assistants=v2'
      }
    end
  end

end