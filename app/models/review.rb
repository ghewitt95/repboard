# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  body        :text
#  stars       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  reviewee_id :bigint           not null
#  reviewer_id :bigint           not null
#
# Indexes
#
#  index_reviews_on_reviewee_id                  (reviewee_id)
#  index_reviews_on_reviewer_id                  (reviewer_id)
#  index_reviews_on_reviewer_id_and_reviewee_id  (reviewer_id,reviewee_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (reviewee_id => users.id)
#  fk_rails_...  (reviewer_id => users.id)
#
class Review < ApplicationRecord
  scope :recent, -> { order(created_at: :desc) }
  scope :positive, -> { where("stars >= ?", 4) }
  belongs_to :reviewer, class_name: "User", counter_cache: :reviews_given_count
  belongs_to :reviewee, class_name: "User", counter_cache: :reviews_received_count

  validates :stars, presence: true, inclusion: { in: 1..5 }
  validates :body, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :reviewer_id, uniqueness: { scope: :reviewee_id, message: "you have already reviewed this freelancer" }
end
