module ApplicationHelper


  def coordinator_page?
    controller_name == "coordinators"
  end

end
