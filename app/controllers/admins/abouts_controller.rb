class Admins::AboutsController < AdminsController
  before_action :set_about, only: [:edit, :update]

  def index
    @abouts = About.all
  end

  def edit
  end

  def update
    respond_to do |format|
      if @about.update_attributes(about_params)
        flash[:success] = 'Descrição editado com sucesso'
        redirect_to @about
      else
        flash[:error] = 'Erro na edição da descrição'
        render :edit
      end
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
