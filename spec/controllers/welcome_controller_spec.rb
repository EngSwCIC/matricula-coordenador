require 'rails_helper'
require 'capybara/rails'


RSpec.describe WelcomeController, type: :controller do

	describe "Sucesfulll navigation static_pages" do
			it 'should render index page' do
	      get :index
	      expect(response).to be_successful
	      expect(response).to have_http_status(200)
	    end

	    it 'should render about page' do
	      get :about
	      expect(response).to be_successful
	      expect(response).to have_http_status(200)
	    end

	    it 'should render services page' do
	      get :index
	      expect(response).to be_successful
	      expect(response).to have_http_status(200)
	    end

	    it 'should render contact page' do
	      get :index
	      expect(response).to be_successful
	      expect(response).to have_http_status(200)
	    end
	end
	
end
