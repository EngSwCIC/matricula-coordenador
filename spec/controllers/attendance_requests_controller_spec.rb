require 'rails_helper'

RSpec.describe AttendanceRequestsController, type: :controller do

  before(:each) do
    @course = Course.create(name: 'Ciência da Computação (Bacharel)')
    @user_student = User.new(name: 'João', email: 'student@student.com', password: '123456', course: @course)
    @user_student.add_role(:student)
    @user_student.save
    sign_in @user_student
  end

  let(:valid_attributes) {
    {user: @user_student, description: 'Requisição de matéria'}
  }

  let(:invalid_attributes) {
    {user: nil, description: nil}
  }

  describe "GET #index" do
    it "returns a success response" do
      AttendanceRequest.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end

    it 'should render user attendance request page' do
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      attendance_request = AttendanceRequest.create! valid_attributes
      get :show, params: {id: attendance_request.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      attendance_request = AttendanceRequest.create! valid_attributes
      get :edit, params: {id: attendance_request.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new AttendanceRequest" do
        expect {
          post :create, params: {attendance_request: valid_attributes}
        }.to change(AttendanceRequest, :count).by(1)
      end

      it "redirects to the created attendance_request" do
        post :create, params: {attendance_request: valid_attributes}
        expect(response).to redirect_to(:attendance_requests)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {attendance_request: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {details: 'Detalhes do atendimento'}
      }

      it "updates the requested attendance_request" do
        attendance_request = AttendanceRequest.create! valid_attributes
        put :update, params: {id: attendance_request.to_param, attendance_request: new_attributes}
        attendance_request.reload
        expect(attendance_request).to have_attributes(details: 'Detalhes do atendimento')
      end

      it "redirects to the attendance_request" do
        attendance_request = AttendanceRequest.create! valid_attributes
        put :update, params: {id: attendance_request.to_param, attendance_request: valid_attributes}
        expect(response).to redirect_to(:attendance_requests)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        attendance_request = AttendanceRequest.create! valid_attributes
        put :update, params: {id: attendance_request.to_param, attendance_request: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested attendance_request" do
      attendance_request = AttendanceRequest.create! valid_attributes
      expect {
        delete :destroy, params: {id: attendance_request.to_param}
      }.to change(AttendanceRequest, :count).by(-1)
    end

    it "redirects to the attendance_requests list" do
      attendance_request = AttendanceRequest.create! valid_attributes
      delete :destroy, params: {id: attendance_request.to_param}
      expect(response).to redirect_to(attendance_requests_url)
    end
  end

end
