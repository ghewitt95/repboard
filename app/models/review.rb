# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  body        :text
#  stars       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  reviewee_id :integer
#  reviewer_id :integer
#
class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewee, class_name: "User"

  validates :stars, presence: true, inclusion: { in: 1..5 }
  validates :body, presence: true
  validates :reviewer_id, uniqueness: { scope: :reviewee_id, message: "you have already reviewed this freelancer" }
end
