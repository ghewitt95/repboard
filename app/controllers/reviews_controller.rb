class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def show
    the_id = params.fetch("id")

    matching_reviews = Review.where({ :id => the_id })

    @the_review = matching_reviews.first

    render({ :template => "review_templates/show" })
  end

  def create
    reviewee = User.find(params.fetch("query_reviewee_id"))

    service = CreateReview.new(
      reviewer: current_user,
      reviewee_id: reviewee.id,
      body: params.fetch("query_body"),
      stars: params.fetch("query_stars")
    )
    if service.call
      redirect_to "/profile/#{service.review.reviewee.slug}", notice: "Review submitted successfully."
    else
      redirect_to "/profile/#{reviewee.slug}", alert: service.error
    end
  end

  def update
    the_id = params.fetch("id")
    the_review = Review.where({ :id => the_id }).first

    the_review.reviewer_id = params.fetch("query_reviewer_id")
    the_review.reviewee_id = params.fetch("query_reviewee_id")
    the_review.body = params.fetch("query_body")
    the_review.stars = params.fetch("query_stars")

    if the_review.valid?
      the_review.save
      redirect_to("/reviews/#{the_review.id}", { :notice => "Review updated successfully." })
    else
      redirect_to("/reviews/#{the_review.id}", { :alert => the_review.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("id")
    the_review = Review.where({ :id => the_id }).first

    if the_review.reviewer_id == current_user.id
      the_review.destroy
      redirect_to("/profile/#{the_review.reviewee.slug}", { :notice => "Review deleted." })
    else
      redirect_to("/profile/#{the_review.reviewee.slug}", { :alert => "Not authorized." })
    end
  end
end
