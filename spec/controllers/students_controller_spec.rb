# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  before(:each) do
    @student = User.new(name: 'Student', email: 'student@email.com', password: '123456')
    @student.add_role(:student)
    @student.save!
    sign_in @student
  end

  describe 'GET #index' do
    it 'return this student' do
      get :index
      expect(assigns(:students)).to match_array([@student])
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      before(:each) do
        put :update, params: { id: @student.to_param,
                               user: {
                                 name: 'novo student2'
                               } }
      end

      it 'updates the student in the database' do
        @student = User.find(@student.id)
        expect(flash[:notice]).to eq('student was successfully updated.')
        expect(@student.name).to eql('novo student2')
      end

      it "redirects to student's path" do
        expect(response).to redirect_to(students_path)
      end
    end

    context 'with invalid attributes' do
      before(:each) do
        put :update, params: { id: @student.id,
                               user: {
                                 email: 'dasdasd.com'
                               } }
      end

      it 'does not updates the student in the database' do
        @student = User.find(@student.id)
        expect(@student.email).to eql('student@email.com')
      end
    end
  end
end
