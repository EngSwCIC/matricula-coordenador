module ApplicationHelper


  def coordinators_page?
    controller_name == "coordinators"
  end

  def students_page?
    controller_name == "students"
  end

end
