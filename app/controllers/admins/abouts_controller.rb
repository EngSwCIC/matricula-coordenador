# frozen_string_literal: true

# Controller para que o admin do sistema tenha acesso a descrição do sistema
# podendo editá-la, desde esta não seja nula
class Admins::AboutsController < AdminsController
  before_action :set_about, only: %i[edit update]

  # Método index da descrição do sistema.
  # Este método mostra ao admin do sistema a descrição atual do sistema
  def index
    @abouts = About.all
  end

  # Método edit da descrição do sistema
  # Este método permite que o admin acesse um formulário com os dados da descrição
  # podendo, assim, editá-la
  def edit; end

  # Método update da descrição do sistema
  # Este método avaliar se os parâmetros estão válidos e os salva.
  # No caso da descrição, apenas avalia se esta não é nula e retorna flashs de sucesso ou fracasso
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
  # Recebe a descrição do sistema pelo id passado
  def set_about
    @about = About.find(params[:id])
  end

  # Recebe os parametros da descrição do sistema
  # Never trust parameters from the scary internet, only allow the white list through.
  def about_params
    params.require(:about).permit(:description)
  end
end
