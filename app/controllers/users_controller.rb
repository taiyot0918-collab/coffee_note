class UsersController < ApplicationController
  # ゲストログインはログイン不要なのでskip
  skip_before_action :authenticate_user!

  def guest_sign_in
    # ゲストユーザーを取得してログイン
    guest = User.find_by!(email: "guest@example.com")
    sign_in guest
    redirect_to root_path, notice: "ゲストユーザーでログインしました"
  end
end