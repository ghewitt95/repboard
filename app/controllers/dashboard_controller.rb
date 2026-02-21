class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @reviews = current_user.reviews_received.order(created_at: :desc)
    
    if params[:stars].present?
      @reviews = @reviews.where(stars: params[:stars])
    end

    @reviews = @reviews.page(params[:page]).per(10)
  end
end
