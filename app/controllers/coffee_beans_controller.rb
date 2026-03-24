class CoffeeBeansController < ApplicationController
  before_action :set_coffee_bean, only: [:show, :edit, :update, :destroy]

  def index
    @coffee_beans = current_user.coffee_beans.order(created_at: :desc)
  end

  def show; end

  def new
    @coffee_bean = current_user.coffee_beans.build
  end

  def create
    @coffee_bean = current_user.coffee_beans.build(coffee_bean_params)
    if @coffee_bean.save
      redirect_to @coffee_bean, notice: "登録しました"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @coffee_bean.update(coffee_bean_params)
      redirect_to @coffee_bean, notice: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @coffee_bean.destroy
    redirect_to coffee_beans_path, notice: "削除しました"
  end

  private

  def set_coffee_bean
    @coffee_bean = current_user.coffee_beans.find(params[:id])
  end

  def coffee_bean_params
    params.require(:coffee_bean).permit(:name, :origin, :variety, :process, :roast_level)
  end
end