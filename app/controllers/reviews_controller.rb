class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    review_params = params.fetch(:review)
    reviewee = User.find(review_params.fetch(:reviewee_id))

    service = CreateReview.new(
      reviewer: current_user,
      reviewee_id: reviewee.id,
      body: review_params.fetch(:body),
      stars: review_params.fetch(:stars)
    )
    if service.call
      redirect_to profile_path(service.review.reviewee.slug), notice: "Review submitted successfully."
    else
      redirect_to profile_path(reviewee.slug), alert: service.error
    end
  end

  def destroy
    the_id = params.fetch(:id)
    the_review = Review.find(the_id)

    if the_review.reviewer_id == current_user.id
      the_review.destroy
      redirect_to profile_path(the_review.reviewee.slug), notice: "Review deleted."
    else
      redirect_to profile_path(the_review.reviewee.slug), alert: "Not authorized."
    end
  end
end
