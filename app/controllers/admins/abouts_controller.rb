# frozen_string_literal: true

class Admins::AboutsController < AdminsController
  before_action :set_about, only: %i[edit update]

  def index
    @abouts = About.all
  end

  def edit; end

  def update
    if @about.update(about_params)
      flash[:success] = 'Descrição editado com sucesso'
      redirect_to admins_abouts_path
    else
      flash[:danger] = 'Erro na edição da descrição'
      redirect_to edit_admins_about_path(@about)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_about
    @about = About.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def about_params
    params.require(:about).permit(:description)
  end
end
