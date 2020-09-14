class ProductsController < ApplicationController
  before_action :redirect_root, only: [:edit, :update, :destroy]
  before_action :authenticate_therapist!, except: [:index, :show]
  before_action :ensure_correct_therapist, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    if current_therapist.id == @product.therapist.id
      @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :qualification_id, :prefecture_id, :self_introduction,
                                    :price).merge(therapist_id: current_therapist.id)
  end

  def ensure_correct_therapist
    @product = Product.find(params[:id])
    redirect_to root_path if current_therapist.id != @product.therapist.id
  end

  def redirect_root
    redirect_to root_path if user_signed_in?
  end
end
