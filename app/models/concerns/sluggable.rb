module Sluggable
  extend ActiveSupport::Concern

  included do
    before_validation :generate_slug, on: :create
  end

  private

  def generate_slug
    return if display_name.blank?
    base_slug = display_name.parameterize
    self.slug = base_slug
    counter = 1
    while self.class.where(slug: self.slug).where.not(id: id).exists?
      self.slug = "#{base_slug}-#{counter}"
      counter += 1
    end
  end
end
