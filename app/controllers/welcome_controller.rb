class WelcomeController < ApplicationController
  def index
    @about = About.first
  end
end
