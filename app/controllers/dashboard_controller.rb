class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @reviews = current_user.reviews_received.order(created_at: :desc).page(params[:page]).per(10)
  end
end
