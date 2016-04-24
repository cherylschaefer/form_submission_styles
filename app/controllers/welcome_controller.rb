class WelcomeController < ApplicationController
  def index
    if current_user.present?
      @tribbles = current_user.tribbles
      @snowflakes = current_user.snowflakes
      @diamond = current_user.diamond
      @putty = current_user.putty
    end
  end
end
