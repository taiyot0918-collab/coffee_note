class CafeShopsController < ApplicationController
  before_action :set_cafe_shop, only: [:show, :edit, :update, :destroy]

  # 一覧ページ: 自分のカフェ記録を新しい順に全件取得
  def index
    @cafe_shops = current_user.cafe_shops.order(created_at: :desc)
  end

  def show; end

  # 新規作成ページ: フォーム用に空のCafeShopオブジェクトを用意する
  def new
    @cafe_shop = current_user.cafe_shops.build
  end

  # 作成処理: フォームから送られたデータをDBに保存する
  def create
    @cafe_shop = current_user.cafe_shops.build(cafe_shop_params)
    if @cafe_shop.save
      redirect_to @cafe_shop, notice: "登録しました"
    else
      # status: :unprocessable_entityを追加
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  # 更新処理: フォームから送られたデータでDBを更新する
  def update
    if @cafe_shop.update(cafe_shop_params)
      redirect_to @cafe_shop, notice: "更新しました"
    else
      # status: :unprocessable_entityを追加
      render :edit, status: :unprocessable_entity
    end
  end

  # 削除処理: DBからレコードを削除して一覧ページに戻る
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