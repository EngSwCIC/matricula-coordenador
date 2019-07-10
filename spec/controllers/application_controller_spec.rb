require "cancan/matchers"
require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  
  before(:each) do
    @coordinator = User.new(email: 'coordinator@coordinator.com', password: '123456')
    @coordinator.add_role(:coordinator)
    @coordinator.save!
    sign_in @coordinator
  end

  before(:each) do
    @admin = User.new(email: 'admin@admin.com', password: '123456')
    @admin.add_role(:admin)
    @admin.save!
    sign_in @admin
  end

  describe "Coordinator" do
    describe "abilities" do
      subject(:ability) { Ability.new(@coordinator) }
      context "when is an account coordinator" do
        it { is_expected.to be_able_to(:manage, AttendanceRequest.new) }
        it { is_expected.to be_able_to(:manage, CreditForm.new) }
      end
    end
  end

  describe "Admin" do
    describe "abilities" do
      subject(:ability) { Ability.new(@admin) }
      context "when is an account coordinator" do
        it { is_expected.to be_able_to(:manage, :all) }
      end
    end
  end
end