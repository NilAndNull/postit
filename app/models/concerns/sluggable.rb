module Sluggable
  extend ActiveSupport::Concern

  included do
    before_save :generate_slug
    class_attribute :sluggable_attribute
  end

  def generate_slug

    if self.class.sluggable_attribute.nil?
      raise "Sluggable attribute not defined. Check Sluggable concern docs."
    end

    original_slug = self.send(self.class.sluggable_attribute.to_sym).to_slug
    slug_candidate = original_slug

    object = self.class.find_by(slug: slug_candidate)
    n = 2;
    while object && object != self
      slug_candidate = original_slug + "-#{n}"
      object = self.class.find_by(slug: slug_candidate)
      n += 1
    end

    self.slug = slug_candidate
  end

  def to_param
    self.slug
  end

  module ClassMethods

    def sluggable(attribute)
      self.sluggable_attribute = attribute
    end

  end

end
