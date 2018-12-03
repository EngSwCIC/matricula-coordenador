require 'rails_helper'

RSpec.describe CreditFormsController, type: :controller do

  before(:each) do
    @user = User.create!(email:"artur123@email.com", password:"aaa123")
    sign_in @user
  end

  context "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should redirect if not logged in" do
      sign_out @user
      get :index
      expect(response).to have_http_status(:redirect)
    end

    it "assigns @credit_forms for student" do
      @user.add_role(:student)

      item = CreditItem.new(description: 'descricao', group: 1, workload: 30, requested_credits_amount: 2)
      item.document.attach(io: File.open(Rails.root.join('public', '224298.png')), filename: '224298.png')
      form = CreditForm.new(user_id: @user.id, credit_items: [item])
      form.save

      get :index
      expect(CreditForm.all.count).to eq(1)
    end

    it "assigns @credit_forms for coordinator" do
      @user.add_role(:coordinator)

      item = CreditItem.new(description: 'descricao', group: 1, workload: 30, requested_credits_amount: 2)
      item.document.attach(io: File.open(Rails.root.join('public', '224298.png')), filename: '224298.png')
      form = CreditForm.new(user_id: @user.id, credit_items: [item])
      form.save

      get :index
      expect(CreditForm.all.count).to eq(1)
    end
  end

  context "GET #show" do
    it "returns http success" do
      item = CreditItem.new(description: 'descricao', group: 1, workload: 30, requested_credits_amount: 2)
      item.document.attach(io: File.open(Rails.root.join('public', '224298.png')), filename: '224298.png')
      form = CreditForm.new(user_id: @user.id, credit_items: [item])
      form.save

      get :show, params: { id: form.id}
      expect(response).to have_http_status(:success)
    end

    it "should redirect if not logged in" do
      sign_out @user
      
      item = CreditItem.new(description: 'descricao', group: 1, workload: 30, requested_credits_amount: 2)
      item.document.attach(io: File.open(Rails.root.join('public', '224298.png')), filename: '224298.png')
      form = CreditForm.new(user_id: @user.id, credit_items: [item])
      form.save

      get :show, params: { id: form.id}
      expect(response).to have_http_status(:redirect)
    end
  end
  
  describe 'Credit forms new and create methods' do
    it 'should return new view' do
      get :new
      expect(response).to have_http_status(200)
    end
    
    it 'should create a new credit form' do
      file = fixture_file_upload(Rails.root.join('public', '224298.png'), 'image/png')
      post :create, params:{ credit_form: { 
            credit_items_attributes: [{ description: 'oi', group: 1, workload: 30,
                                        requested_credits_amount: 2,
                                        document: file }] }}
      expect(flash[:success]).to eq('Seu formulário de aproveitamento de créditos foi criado com sucesso')
      expect(CreditForm.count).to be(1)
    end

    it 'should not create a new credit form' do
      file = fixture_file_upload(Rails.root.join('public', '224298.png'), 'image/png')
      post :create, params:{ credit_form: { 
            credit_items_attributes: [{ description: 'oi', group: 1, workload: 30,
                                        requested_credits_amount: 2 }] }}
      expect(CreditForm.count).to be(0)
      expect(response).to render_template(:new)
    end
  end

  context "GET #edit" do
    it "returns http success" do
      item = CreditItem.new(description: 'descricao', group: 1, workload: 30, requested_credits_amount: 2)
      item.document.attach(io: File.open(Rails.root.join('public', '224298.png')), filename: '224298.png')
      form = CreditForm.new(user_id: @user.id, credit_items: [item])
      form.save

      get :edit, params: { id: form.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    it 'should update an existing credit form' do
      file = fixture_file_upload(Rails.root.join('public', '224298.png'), 'image/png')

      item = CreditItem.new(description: 'descricao', group: 1, workload: 30, requested_credits_amount: 2)
      item2 = CreditItem.new(description: 'descricao2', group: 1, workload: 30, requested_credits_amount: 2)

      item.document.attach(io: File.open(Rails.root.join('public', '224298.png')), filename: '224298.png')
      item2.document.attach(io: File.open(Rails.root.join('public', '224298.png')), filename: '224298.png')

      form = CreditForm.new(user_id: @user.id, credit_items: [item])
      form.save

      put :update, params: { id: form.id , :credit_form => form.attributes = { credit_items: [item2] } }
      expect(CreditForm.count).to be(1)
    end

    it 'should not update an existing credit form' do
      file = fixture_file_upload(Rails.root.join('public', '224298.png'), 'image/png')

      item = CreditItem.new(description: 'descricao', group: 1, workload: 30, requested_credits_amount: 2)
      item2 = CreditItem.new(description: 'descricao2', group: 1, requested_credits_amount: 2)
      
      item.document.attach(io: File.open(Rails.root.join('public', '224298.png')), filename: '224298.png')
      form = CreditForm.new(user_id: @user.id, credit_items: [item])
      form.save

      assert_raises(ActiveRecord::RecordNotSaved) do
        put :update, params: { id: form.id , :credit_form => form.attributes = { credit_items: [item2] } }
      end
    end
  end

  describe 'POST #destroy' do
    it 'should update an existing credit form' do
      file = fixture_file_upload(Rails.root.join('public', '224298.png'), 'image/png')

      item = CreditItem.new(description: 'descricao', group: 1, workload: 30, requested_credits_amount: 2)
      item.document.attach(io: File.open(Rails.root.join('public', '224298.png')), filename: '224298.png')
      form = CreditForm.new(user_id: @user.id, credit_items: [item])
      form.save

      delete :destroy, params: { id: form }
      expect(CreditForm.count).to be(0)
    end
  end

end