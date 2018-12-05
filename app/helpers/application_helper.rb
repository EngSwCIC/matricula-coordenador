# frozen_string_literal: true

module ApplicationHelper
  def coordinators_page?
    controller_name == 'coordinators'
  end

  def abouts_page?
    controller_name == 'abouts'
  end
end
