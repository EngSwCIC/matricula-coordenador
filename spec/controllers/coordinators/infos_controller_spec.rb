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
      expect(response).to be_successful
    end
    
  end

  describe "PUT #update" do

    context "with valid attributes" do
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

      it "should flash success" do
        put :update, params: {id: @coordinator.to_param, user: new_attributes}
        @coordinator.reload
        expect(flash[:success]).to eq('Sucesso na edição dos dados do coordenador')
      end
    end

    context "with invalid attributes" do
      let(:new_attributes) {
        { 
          name: "Matheus Rodrigues",
          email: ''
        }
      }
      
      it "does not updates the coordinator infos in the database" do
        put :update, params: {id: @coordinator.to_param, user: new_attributes}
        expect(flash[:danger]).to eq('Erro na edição dos dados do coordenador')
      end

    end

  end

end