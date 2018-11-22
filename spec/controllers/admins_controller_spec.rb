require 'rails_helper'
require 'capybara/rails'

RSpec.describe AdminsController, type: :controller do

  before(:each) do
    @admin = User.new(email: "admin@admin.com", password: "123456")
    @admin.add_role(:admin)
    @admin.save!
    sign_in @admin
  end

  describe "Sucesfulll navigation in backoffice admin pages" do
    it 'should render backoffice page' do
      get :backoffice
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end