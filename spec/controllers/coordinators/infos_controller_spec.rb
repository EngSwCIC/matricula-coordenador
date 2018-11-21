require 'rails_helper'

RSpec.describe Coordinators::InfosController, type: :controller do

  before(:each) do
    @coordinator = User.new(name: "Matheus", email: "coord@email.com", password: "aaa123")
    @coordinator.add_role(:coordinator)
    @coordinator.save!
    
    sign_in @coordinator
  end

  describe "GET #index" do
    it "should returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #edit" do
    it "should returns a success response" do
      get :edit, params: {id: @coordinator.to_param}
      expect(response).to be_success
    end
    
  end

  describe "PUT #update" do
    let(:new_attributes) {
      { 
        name: "Matheus Rodrigues",
      }
    }
    it "should updates the requested coordinator" do
      put :update, params: {id: @coordinator.to_param, user: new_attributes}
      @coordinator.reload
      expect(@coordinator).to be_valid
    end

    it "should redirects to the coordinator's info" do
      put :update, params: {id: @coordinator.to_param, user: new_attributes}
      @coordinator.reload
      expect(response).to redirect_to(coordinators_infos_path)
    end
  end

end