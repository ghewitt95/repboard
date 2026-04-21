class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    reviewee = User.find(params.fetch("query_reviewee_id"))

    service = CreateReview.new(
      reviewer: current_user,
      reviewee_id: reviewee.id,
      body: params.fetch("query_body"),
      stars: params.fetch("query_stars")
    )
    if service.call
      redirect_to profile_path(service.review.reviewee.slug), notice: "Review submitted successfully."
    else
      redirect_to profile_path(reviewee.slug), alert: service.error
    end
  end

  def destroy
    the_id = params.fetch("id")
    the_review = Review.find(the_id)

    if the_review.reviewer_id == current_user.id
      the_review.destroy
      redirect_to profile_path(the_review.reviewee.slug), notice: "Review deleted."
    else
      redirect_to profile_path(the_review.reviewee.slug), alert: "Not authorized."
    end
  end
end
