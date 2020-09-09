class ProductsController < ApplicationController
  def index
    @products = Product.all.includes(:therapist).order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:image, :qualification_id, :prefecture_id, :self_introduction,
                                    :price).merge(therapist_id: current_therapist.id)
  end
end
