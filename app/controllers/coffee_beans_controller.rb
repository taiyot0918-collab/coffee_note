class CoffeeBeansController < ApplicationController
  # show, edit, update, destroyアクションの前に
  # set_coffee_beanメソッドを実行する（@coffee_beanをセットするため）
  before_action :set_coffee_bean, only: [:show, :edit, :update, :destroy]

  # 一覧ページ: 自分のコーヒー豆を新しい順に全件取得
  def index
    @coffee_beans = current_user.coffee_beans.order(created_at: :desc)
  end

  # 詳細ページ: before_actionで@coffee_beanがセットされているので何も書かなくてOK
  def show; end

  # 新規作成ページ: フォーム用に空のCoffeeBeanオブジェクトを用意する
  def new
    @coffee_bean = current_user.coffee_beans.build
  end

  # 作成処理: フォームから送られたデータをDBに保存する
  def create
    @coffee_bean = current_user.coffee_beans.build(coffee_bean_params)
    if @coffee_bean.save
      # 保存成功 → 詳細ページにリダイレクト
      redirect_to @coffee_bean, notice: "登録しました"
    else
      # 保存失敗 → フォームを再表示してエラーを見せる
      render :new
    end
  end

  # 編集ページ: before_actionで@coffee_beanがセットされているので何も書かなくてOK
  def edit; end

  # 更新処理: フォームから送られたデータでDBを更新する
  def update
    if @coffee_bean.update(coffee_bean_params)
      redirect_to @coffee_bean, notice: "更新しました"
    else
      render :edit
    end
  end

  # 削除処理: DBからレコードを削除して一覧ページに戻る
  def destroy
    @coffee_bean.destroy
    redirect_to coffee_beans_path, notice: "削除しました"
  end

  private

  # @coffee_beanをセットするメソッド
  # current_user.coffee_beansから探すことで、他人のデータにアクセスできないようにしている
  def set_coffee_bean
    @coffee_bean = current_user.coffee_beans.find(params[:id])
  end

  # フォームから受け取るパラメーターを制限する（Strong Parameters）
  # 許可していないパラメーターは無視されるのでセキュリティ対策になる
  def coffee_bean_params
    params.require(:coffee_bean).permit(:name, :origin, :variety, :process, :roast_level)
  end
end