class CafeShopsController < ApplicationController
  before_action :set_cafe_shop, only: [:show, :edit, :update, :destroy]

  def index
    @cafe_shops = current_user.cafe_shops.order(created_at: :desc)
  end

  def show; end

  def new
    @cafe_shop = current_user.cafe_shops.build
  end

  def create
    @cafe_shop = current_user.cafe_shops.build(cafe_shop_params)
    if @cafe_shop.save
      redirect_to @cafe_shop, notice: "登録しました"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @cafe_shop.update(cafe_shop_params)
      redirect_to @cafe_shop, notice: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @cafe_shop.destroy
    redirect_to cafe_shops_path, notice: "削除しました"
  end

  private

  def set_cafe_shop
    @cafe_shop = current_user.cafe_shops.find(params[:id])
  end

  def cafe_shop_params
    params.require(:cafe_shop).permit(:name, :address, :visit_date, :memo, :rating)
  end
end