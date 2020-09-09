class ReservationsController < ApplicationController
  before_action :set_product

  def index
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.valid?
      @reservation.save
    else
      render :index
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

end
