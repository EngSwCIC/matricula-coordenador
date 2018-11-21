require 'rails_helper'

RSpec.describe Admins::CoordinatorsController, type: :controller do

  describe Admins::CoordinatorsController do
    before(:each) do
      @admin = User.new(email: "admin@admin.com", password: "123456")
      @admin.add_role(:admin)
      @admin.save!
    end
    
    describe "GET #index" do
      it "return all coodinators" do
        sign_in @admin
        coor1 = User.create!(email: "coor1@coor1.com", password: "123456")
        coor1.add_role(:coordinator)
        coor2 = User.create!(email: "coor2@coor2.com", password: "123456")
        coor2.add_role(:coordinator)
        get :index
        expect(assigns(:coordinators)).to match_array([coor1, coor2])
      end
      
      it "renders the :index view" do
        sign_in @admin
        get :index
        expect(response).to render_template("index")
      end
    end
    
    describe "GET #new" do
      it "assigns a new Coodinator to @coordinator" do
        sign_in @admin
        get :new
        expect(assigns(:coordinator)).to_not be_nil
      end
      
      it "renders the :new template" do
        sign_in @admin
        get :new
        expect(response).to render_template(:new)
      end

    end
    
    describe "POST #create" do
      context "with valid attributes" do
        before(:each) do 
          sign_in @admin
          post :create, params: { user: {
                                    name: "novo coordenador",
                                    email: "coord@coord.com",
                                    password: "123456"} }
        end
        it "saves the new coodinator in the database" do
          expect(flash[:notice]).to eq('coordinator was successfully created.')
          expect(User.with_role(:coordinator).count).to be(1)
        end
        
        it "redirects to backoffice coordinators" do
          expect(response).to redirect_to(admins_coordinators_path)
        end
      end
      
      context "with invalid attributes" do
        before(:each) do 
          sign_in @admin
          post :create, params: { user: {
                                    name: "novo coordenador",
                                    email: "coord@coord.com",
                                    password: ""} }
        end

        it "does not save the new coordinator in the database" do
          expect(User.with_role(:coordinator).count).to be(0)
        end
      end
    end

    describe "PUT #update" do
      context "with valid attributes" do
        before(:each) do 
          sign_in @admin
          @coordinator = User.create(name: "novo coordenador",
                                     email: "email@email.com",
                                     password: "123456")

          put :update, params: { id: @coordinator.id, 
                                 user: {
                                    name: 'novo coordenador2' } }
        end

        it "updates the coodinator in the database" do
          @coordinator = User.find(@coordinator.id)
          expect(flash[:notice]).to eq('Coordinator was successfully updated.')
          expect(@coordinator.name).to eql('novo coordenador2')
        end
        
        it "redirects to backoffice coordinators" do
          expect(response).to redirect_to(admins_coordinators_path)
        end
      end
      
      context "with invalid attributes" do
        before(:each) do 
          sign_in @admin
          @coordinator = User.create(name: "novo coordenador",
                                     email: "email@email.com",
                                     password: "123456")

          put :update, params: { id: @coordinator.id, 
                                 user: {
                                   email: 'dasdasd.com' } }
        end

        it "updates the coodinator in the database" do
          @coordinator = User.find(@coordinator.id)
          expect(@coordinator.email).to eql('email@email.com')
        end

        it "does not save the new coordinator in the database" do
          expect(User.with_role(:coordinator).count).to be(0)
        end
      end
    end

    describe "GET #edit" do
      before(:each) do 
          sign_in @admin
          @coordinator = User.create(name: "novo coordenador",
                                     email: "email@email.com",
                                     password: "123456")
          
          get :edit, params: {id: @coordinator.id}

      end

      it "assigns a new Coodinator to @coordinator" do
        expect(assigns(:coordinator)).to_not be_nil
      end
      
      it "renders the :edit template" do
        expect(response).to render_template(:edit)
      end
    end

  end
end
