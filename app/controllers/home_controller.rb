class HomeController < ApplicationController
  def index

  end

  def chat
    @response = infer(params[:prompt])
    puts @response
    # Add to messages
    MESSAGES.push(:@response)

    redirect_to root_path, notice: @response
  end
end
