class BrewNotesController < ApplicationController
  before_action :set_brew_note, only: [:show, :edit, :update, :destroy]

  def index
    @brew_notes = current_user.brew_notes.order(created_at: :desc)
  end

  def show; end

  def new
    @brew_note = current_user.brew_notes.build
  end

  def create
    @brew_note = current_user.brew_notes.build(brew_note_params)
    if @brew_note.save
      redirect_to @brew_note, notice: "登録しました"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @brew_note.update(brew_note_params)
      redirect_to @brew_note, notice: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @brew_note.destroy
    redirect_to brew_notes_path, notice: "削除しました"
  end

  private

  def set_brew_note
    @brew_note = current_user.brew_notes.find(params[:id])
  end

  def brew_note_params
    params.require(:brew_note).permit(:coffee_bean_id, :tool, :dose, :water_amount, :water_temp, :brew_time, :taste_memo, :rating)
  end
end