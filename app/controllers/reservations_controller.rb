class ReservationsController < ApplicationController
  before_action :set_product
  before_action :authenticate_user!

  def index
    @reservation = ProductReservation.new
  end

  def create
    @reservation = ProductReservation.new(reservation_params)
    if @reservation.valid?
      @reservation.save
      render :create
    else
      render :index
    end
  end

  private

  def reservation_params
    params.permit(:full_name, :full_name_kana, :gender, :age, :prefecture_id, :city,
                  :address, :building_name, :phone_number, :datetime, :product_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

end
