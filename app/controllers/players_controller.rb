class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      flash[:notice] = 'Ator ou Atriz adicionado com sucesso.'
      redirect_to root_path
    else
      flash.now[:alert] = 'Erro ao adicionar Ator ou Atriz.'
      @player.valid?
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @player = Player.find_by(id: params[:id])
  end

  private

  def player_params
    params.require(:player).permit(:name, :birth_date, :nacionality)
  end
end