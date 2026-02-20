class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :slug, uniqueness: true, allow_nil: true

  has_many :reviews_given, class_name: "Review", foreign_key: "reviewer_id", dependent: :destroy
  has_many :reviews_received, class_name: "Review", foreign_key: "reviewee_id", dependent: :destroy

  before_validation :generate_slug, on: :create

  private

  def generate_slug
    return if display_name.blank?
    base_slug = display_name.parameterize
    self.slug = base_slug
    counter = 1
    while User.where(slug: self.slug).where.not(id: id).exists?
      self.slug = "#{base_slug}-#{counter}"
      counter += 1
    end
  end
end
