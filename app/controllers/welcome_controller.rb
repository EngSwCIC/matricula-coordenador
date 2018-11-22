class WelcomeController < ApplicationController
  def index
    @about = About.first
  end

  def about
  end

  def services
  end

  def contact
  end
end
