# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  bio                    :text
#  display_name           :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  reviewable             :boolean          default(FALSE)
#  slug                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  include Sluggable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :slug, uniqueness: true, allow_nil: true

  has_many :reviews_given, class_name: "Review", foreign_key: "reviewer_id", dependent: :destroy
  has_many :reviews_received, class_name: "Review", foreign_key: "reviewee_id", dependent: :destroy

  def average_rating
    reviews_received.average(:stars)&.round(1)
  end

  def review_count
    reviews_received.count
  end
end
