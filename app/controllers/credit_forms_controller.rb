class CreditFormsController < ApplicationController
  before_action :authenticate_user!
  def index
    @credit_forms = CreditForm.all
  end

  def new
    @credit_form = CreditForm.new
    1.times { @credit_form.credit_items.build }
  end

  def show
    @credit_form = CreditForm.find(params[:id])
  end

  def create
    @credit_form = CreditForm.create(credit_form_params)
    if @credit_form.save
      flash[:success] = 'Seu formulário de aproveitamento de créditos foi criado com sucesso'
      redirect_to @credit_form
    else
      render :new
    end
  end

  def edit
    @credit_form = CreditForm.find(params[:id])
  end

  def update
    @credit_form = CreditForm.find(params[:id])
    if @credit_form.update_attributes(credit_form_params)
      flash[:success] = 'Formulário de aproveitamento de créditos editado com sucesso'
      redirect_to @credit_form
    else
      render :edit
    end
  end

  def destroy
    @credit_form = CreditForm.find(params[:id])
    @credit_form.destroy
    redirect_to credit_forms_path
  end


  private
    def credit_form_params
      params.require(:credit_form).permit(:name, :matricula, :email, :cellphone,
        :curso, :requisition_number, :sei, :received_at,
        credit_items_attributes: [:id, :credit_form, :description, :group,
        :workload, :requested_credits_amount, :document, :_destroy])
    end
end