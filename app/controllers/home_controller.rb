class HomeController < ApplicationController
  def index
    # Initialize session messages if not already present
    session[:messages] ||= []
  end

  def chat
    # Initialize session messages if not already present
    session[:messages] ||= []

    # Add user message to session
    session[:messages] << {
      "role" => "user",
      "content" => params[:prompt]
    }

    # Process the input and get the response
    @response = infer(params[:prompt])
    puts @response

    # Add bot response to session
    session[:messages] << {
      "role" => "bot",
      "content" => @response
    }

    redirect_to root_path, notice: "Successfully fetched response."
  end

  def delete
    session[:messages] = []
    puts "Cleared messages."
    redirect_to root_path, notice: "Chat history cleared."
  end
end
