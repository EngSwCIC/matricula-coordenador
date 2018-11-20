class CoordinatorsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_coordinator
  
    private
  
    def check_coordinator
      redirect_to root_path unless current_user.has_role? :coordinator
    end
  end
  