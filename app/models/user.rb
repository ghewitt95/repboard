class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :reviews_given, class_name: "Review", foreign_key: "reviewer_id", dependent: :destroy
  has_many  :reviews_received, class_name: "Review", foreign_key: "reviewee_id", dependent: :destroy
end
