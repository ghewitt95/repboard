class ClientDashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviews = current_user.reviews_given.order(created_at: :desc)
  end
end
