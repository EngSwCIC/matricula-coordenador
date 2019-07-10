require "rails_helper"

RSpec.describe AttendanceRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/attendance_requests").to route_to("attendance_requests#index")
    end

    it "routes to #new" do
      expect(:get => "/attendance_requests/new").to route_to("attendance_requests#new")
    end

    it "routes to #show" do
      expect(:get => "/attendance_requests/1").to route_to("attendance_requests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/attendance_requests/1/perform_attendance").to route_to("attendance_requests#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/attendance_requests").to route_to("attendance_requests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/attendance_requests/1").to route_to("attendance_requests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/attendance_requests/1").to route_to("attendance_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/attendance_requests/1").to route_to("attendance_requests#destroy", :id => "1")
    end
  end
end
