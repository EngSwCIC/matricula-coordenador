require 'rails_helper'

RSpec.describe CreditFormsController, type: :controller do
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Credit forms new and create methods' do
    it 'should return new view' do
      get :new
      expect(response).to have_http_status(200)
    end

    it 'should create a new credit form' do

      post :create, params:{ credit_form: {name: 'joao silva', email: 'joaosilva@unb.br',
        credit_items: [{ description: 'oi' }] }}
      expect(flash[:success]).to eq('Seu formulário de aproveitamento de créditos foi criado com sucesso')
      expect(CreditForm.count).to be(1)
    end
  end
end