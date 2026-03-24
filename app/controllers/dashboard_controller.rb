class DashboardController < ApplicationController
  def index
    @coffee_beans = current_user.coffee_beans.order(created_at: :desc).limit(5)
    @brew_notes = current_user.brew_notes.order(created_at: :desc).limit(5)
    @cafe_shops = current_user.cafe_shops.order(created_at: :desc).limit(5)
  end
end