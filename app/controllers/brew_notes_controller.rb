class BrewNotesController < ApplicationController
  before_action :set_brew_note, only: [:show, :edit, :update, :destroy]

  # 一覧ページ: 自分の抽出ノートを新しい順に全件取得
  def index
    @brew_notes = current_user.brew_notes.order(created_at: :desc)
  end

  def show; end

  # 新規作成ページ: フォーム用に空のBrewNoteオブジェクトを用意する
  def new
    @brew_note = current_user.brew_notes.build
  end

  # 作成処理: フォームから送られたデータをDBに保存する
  def create
    @brew_note = current_user.brew_notes.build(brew_note_params)
    if @brew_note.save
      redirect_to @brew_note, notice: "登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  # 更新処理: フォームから送られたデータでDBを更新する
  def update
    if @brew_note.update(brew_note_params)
      redirect_to @brew_note, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 削除処理: DBからレコードを削除して一覧ページに戻る
  def destroy
    @brew_note.destroy
    redirect_to brew_notes_path, notice: "削除しました"
  end

  private

  def set_brew_note
    @brew_note = current_user.brew_notes.find(params[:id])
  end

  # coffee_bean_idを許可することで、どの豆を使ったか紐付けられる
  def brew_note_params
    params.require(:brew_note).permit(:coffee_bean_id, :tool, :dose, :water_amount, :water_temp, :brew_time, :taste_memo, :rating)
  end
end