class DiscountsController < ApplicationController

  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def new
    @discount = Discount.new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    @discount = Discount.new(discount_params)
    if @discount.save
      redirect_to(merchant_discounts_path(params[:merchant_id]))
    else
      flash[:error] = "Fill in all fields."
      @merchant = Merchant.find(params[:merchant_id])
      render :new
    end
  end

  private
  def discount_params
    params.permit(:percent, :threshold, :merchant_id)
  end
end