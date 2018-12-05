# frozen_string_literal: true

class CreditFormsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.has_role?(:coordinator) || current_user.has_role?(:admin)
      @credit_forms = CreditForm.all
    elsif current_user.has_role? :student
      @credit_forms = CreditForm.where(user_id: current_user)
    end
  end

  def new
    @credit_form = CreditForm.new
    @credit_form = current_user.credit_forms.build
    1.times { @credit_form.credit_items.build }
  end

  def show
    @credit_form = CreditForm.find(params[:id])
    @items = @credit_form.credit_items
  end

  def create
    @credit_form = CreditForm.create(credit_form_params)
    @credit_form = current_user.credit_forms.build(credit_form_params)
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
    params.require(:credit_form).permit(:user_id, :name, :matricula, :email, :cellphone,
                                        :curso, :requisition_number, :sei, :received_at,
                                        credit_items_attributes: %i[id credit_form description group
                                                                    workload requested_credits_amount document _destroy])
  end
end
