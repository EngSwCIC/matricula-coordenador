require 'rails_helper'


RSpec.describe RegistrationsController, type: :controller do  
    describe "create" do
      it 'should create an user' do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        get :new
        post :create, params: { user: { name: 'Student', email: 'student@email.com', password: '123456' } }
        expect(response).to have_http_status(:redirect)
      end
    end
end