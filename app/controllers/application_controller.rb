class ApplicationController < ActionController::Base
  # すべてのコントローラーに適用される処理
  # ログインしていないユーザーはログイン画面にリダイレクトする
  before_action :authenticate_user!
end