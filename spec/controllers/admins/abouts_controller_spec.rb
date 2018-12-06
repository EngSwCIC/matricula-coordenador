# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admins::AboutsController, type: :controller do
  describe Admins::AboutsController do
    before(:each) do
      @admin = User.new(email: 'admin@admin.com', password: '123456')
      @admin.add_role(:admin)
      @admin.save!
    end

    describe 'GET #index' do
      it 'return all abouts' do
        sign_in @admin
        about1 = About.create!(description: 'Olá Mundo')
        about2 = About.create!(description: 'Olá Mundo Novamente')
        get :index
        expect(assigns(:abouts)).to match_array([about1, about2])
      end

      it 'renders the :index view' do
        sign_in @admin
        get :index
        expect(response).to render_template('index')
      end
    end

    describe 'GET #edit' do
      before(:each) do
        sign_in @admin
        @about = About.create(description: 'Olá Mundo!')
        get :edit, params: { id: @about.id }
      end

      it 'assigns a new About to @about' do
        expect(assigns(:about)).to_not be_nil
      end

      it 'renders the :edit template' do
        expect(response).to render_template(:edit)
      end
    end

    describe 'PUT #update' do
      context 'with valid attributes' do
        before(:each) do
          sign_in @admin
          @about = About.create(description: 'Olá Mundo!')

          put :update, params: { id: @about.id,
                                 about: { description: 'nova descricao' } }
        end

        it 'updates the about in the database' do
          @about = About.find(@about.id)
          expect(flash[:success]).to eq('Descrição editado com sucesso')
          expect(@about.description).to eql('nova descricao')
        end

        it 'redirects to backoffice about' do
          expect(response).to redirect_to(admins_abouts_path)
        end
      end

      context 'with invalid attributes' do
        before(:each) do
          sign_in @admin
          @about = About.create(description: 'Olá Mundo!')

          put :update, params: { id: @about.id,
                                 about: { description: '' } }
        end

        it 'does not updates the about in the database' do
          @about = About.find(@about.id)
          expect(flash[:danger]).to eq('Erro na edição da descrição')
          expect(@about.description).to eql('Olá Mundo!')
        end
      end
    end
  end
end
