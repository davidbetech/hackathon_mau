class ProductosController < ApplicationController
  before_action :set_mercado, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_producto, only: [:show, :edit, :update, :destroy]

  def index
    @productos = @mercado.productos
  end

  def show
  end

  def new
    @producto = @mercado.productos.new
  end

  def create
    @producto = @mercado.productos.new(producto_params)
    if @producto.save
      redirect_to mercado_path(@mercado), notice: "Producto creado."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @producto.update(producto_params)
      redirect_to mercado_productos_path(@mercado), notice: "Producto actualizado."
    else
      render :edit
    end
  end

  def destroy
    @producto.destroy
    redirect_to mercado_productos_path(@mercado), notice: "Producto eliminado."
  end

  private

  def set_mercado
    @mercado = Mercado.find(params[:mercado_id])
  end

  def set_producto
    @producto = @mercado.productos.find(params[:id])
  end

  def producto_params
    params.require(:producto).permit(:nombre, :precio, :unidad, :equivalente_de_id)
  end
end