class MercadosController < ApplicationController
  before_action :set_mercado, only: [ :show, :edit, :update, :destroy ]
  before_action :mercado_params, only: [ :create, :update ]

  def index
    @mercados = Mercado.all
  end

  def show
  end

  def new
    @mercado = Mercado.new
  end

  def create
    @mercado = Mercado.new(mercado_params)
    if @mercado.save
      redirect_to @mercado, notice: "Mercado se creo."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @mercado.update(mercado_params)
      redirect_to @mercado, notice: "Mercado se actualizo."
    else
      render :edit
    end
  end

  def destroy
    @mercado.destroy
    redirect_to mercados_url, notice: "Mercado se elimino"
  end

  private
  def mercado_params
    params.require(:mercado).permit(:id, :nombre, :alcaldia, :ubicacion)
  end
  def set_mercado
    @mercado = Mercado.find(params[:id])
  end
end
