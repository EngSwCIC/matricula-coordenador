class WelcomeController < ApplicationController
  def index
    @about = About.first
  end

  def about
    @about = About.first
  end

  def coordinators
    @coordinators = User.with_role(:coordinator).order(:name)
  end

  def show
    @coordinator = User.find(params[:id])
  end

  def contact
  end

  def information
  end
end
