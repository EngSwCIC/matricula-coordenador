# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

RSpec.describe WelcomeController, type: :controller do
  describe 'Sucesfulll navigation static_pages' do
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

    it 'should render coordinators page' do
      get :coordinators
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'should render contact page' do
      get :contact
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  # RSpec.describe "HomeFooters", type: :feature do
  #   # it "should list the article titles on the index" do
  #   #   visit attendance_request_path
  #   # end
  # end

  describe 'GET #index' do
    it 'return all coodinators' do
      coor1 = User.create!(email: 'coor1@coor1.com', password: '123456')
      coor1.add_role(:coordinator)
      coor2 = User.create!(email: 'coor2@coor2.com', password: '123456')
      coor2.add_role(:coordinator)
      get :coordinators
      expect(assigns(:coordinators)).to match_array([coor1, coor2])
    end

    it 'renders the :coordinators view' do
      get :coordinators
      expect(response).to render_template('coordinators')
    end

    it 'return the description of the system in the index' do
      about = About.create(description: 'Bom dia')
      get :index
      expect(assigns(:about)).to match(about)
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template('index')
    end

    it 'return the description of the system in the about' do
      about = About.create(description: 'Bom dia')
      get :about
      expect(assigns(:about)).to match(about)
    end

    it 'renders the :about view' do
      get :about
      expect(response).to render_template('about')
    end
  end

  describe 'GET #show' do
    before(:each) do
      @coordinator = User.create!(email: 'coor1@coor1.com', password: '123456')
      @coordinator.add_role(:coordinator)
      get :show, params: { id: @coordinator.id }
    end

    it 'return the coordinator' do
      expect(assigns(:coordinator)).to match(@coordinator)
    end

    it 'renders the :show template' do
      expect(response).to render_template(:show)
    end
  end
end
