require "net/http"
require "json"
require "uri"

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Ensure session[:messages] is initialized before each action
  before_action :initialize_session_messages

  def infer(message)
    uri = URI("http://localhost:11434/api/generate")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
    request.body = {
      "model" => "llama3.1",
      "prompt" => message
    }.to_json

    # Perform the HTTP request
    response = http.request(request)

    # Read the entire response body
    response_body = response.body

    puts @response_body

    # Handle the response as newline-separated JSON objects
    responses = []
    response_body.each_line do |line|
      begin
        json = JSON.parse(line)
        if json["response"]
          responses << json["response"]
        end
      rescue JSON::ParserError => e
        # Handle JSON parsing errors (optional)
        puts "JSON parse error: #{e.message}"
      end
    end

    # Join all responses together
    puts responses.join
    responses.join
  end

  private

  def initialize_session_messages
    # Initialize session[:messages] if it's not already set
    session[:messages] ||= []
  end
end
