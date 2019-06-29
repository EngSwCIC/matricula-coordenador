# frozen_string_literal: true

# Controller para o application
class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger, :info
  
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, danger: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
end
