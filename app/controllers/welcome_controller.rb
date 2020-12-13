class WelcomeController < ApplicationController
  def index
    render json: "Welcome to the Heros and Villains API. The current time is #{ Time.now }."
  end

end
