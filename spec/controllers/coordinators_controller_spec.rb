require 'rails_helper'
require 'capybara/rails'

RSpec.describe CoordinatorsController, type: :controller do

  before(:each) do
    @coordinator = User.new(email: "coordinator@coordinator.com", password: "123456")
    @coordinator.add_role(:coordinator)
    @coordinator.save!
    sign_in @coordinator
  end

  describe "Sucesfulll navigation in backoffice coordinators pages" do
    it 'should render coordinators backoffice page' do
      get :coordinators_backoffice
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end