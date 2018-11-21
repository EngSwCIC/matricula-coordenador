require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

  before(:each) {
    @request.env["devise.mapping"] = Devise.mappings[:user]
  }

	describe RegistrationsController do
		describe "registration #new" do
      it "assign a new User to @user" do
      	get :new
        expect(assigns(:user)).to_not be_nil
    	end
    end

    describe "registration #create" do
      it "create a new user via registration make a student" do
      	post :create, params: { user: {
      												   email: "teste@teste.com",
      												   password: "123456",
      												   password_confirmation: "123456"
      												 } }

      	user = User.find_by(email: "teste@teste.com")
        expect(user.has_role? :student).to be(true)
    	end
    end
	end
end
