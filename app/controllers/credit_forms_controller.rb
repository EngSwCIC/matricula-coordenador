# frozen_string_literal: true

# Controller para que os alunos do sistema façam requisições pelos formulários de concessão de créditos
class CreditFormsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_credit_form, only: %i[show edit update destroy]

  # Método index dos forms de concessão
  def index
    if current_user.has_role?(:coordinator) || current_user.has_role?(:admin)
      @credit_forms = CreditForm.all
    elsif current_user.has_role? :student
      @credit_forms = CreditForm.where(user_id: current_user)
    end
  end

  # Método new dos forms de concessão
  def new
    @credit_form = current_user.credit_forms.build
    1.times { @credit_form.credit_items.build }
  end

  # Método show dos forms de concessão
  def show
    @items = @credit_form.credit_items
  end

  # Método create dos forms de concessão
  def create
    @credit_form = current_user.credit_forms.build(credit_form_params)
    if @credit_form.save
      flash[:success] = 'Seu formulário de aproveitamento de créditos foi criado com sucesso'
      redirect_to @credit_form
    else
      render :new
    end
  end

  # Método edit dos forms de concessão
  def edit; end

  # Método update dos forms de concessão
  def update
    if @credit_form.update(credit_form_params)
      flash[:success] = 'Formulário de aproveitamento de créditos editado com sucesso'
      redirect_to @credit_form
    else
      render :edit
    end
  end

  # Método destroy dos forms de concessão
  def destroy
    @credit_form.destroy
    redirect_to credit_forms_path
  end

  private

  # Pega o form de concessão pela id
  def set_credit_form
    @credit_form = CreditForm.find(params[:id])
  end

  # Parâmetros dos form de concessão
  def credit_form_params
    params.require(:credit_form).permit(:user_id, :name, :matricula, :email, :cellphone,
                                        :curso, :requisition_number, :sei, :received_at,
                                        credit_items_attributes: %i[id credit_form description group
                                                                    workload requested_credits_amount document _destroy])
  end
end
