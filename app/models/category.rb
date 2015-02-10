# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#  index_categories_on_slug  (slug) UNIQUE
#

class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true
  validates :name, uniqueness: true

  before_save :generate_slug


  def generate_slug
    original_slug = slug_candidate = self.name.to_slug

    category = Category.find_by(slug: slug_candidate)
    n = 2;
    while category && category != self
      slug_candidate = original_slug + "-#{n}"
      category = Category.find_by(slug: slug_candidate)
      n += 1
    end

    self.slug = slug_candidate
  end

  def to_param
    self.slug
  end
end
