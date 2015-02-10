# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  url         :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  slug        :string
#
# Indexes
#
#  index_posts_on_slug     (slug) UNIQUE
#  index_posts_on_url      (url) UNIQUE
#  index_posts_on_user_id  (user_id)
#

class Post < ActiveRecord::Base
  include Voteable

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :title, length: {minimum: 5}

  validates :url, presence: true
  validates :url, format: { with: URI.regexp },
                          if: Proc.new { |a| a.url.present? }
  validates :url, uniqueness: true

  validates :description, presence: true

  before_save :generate_slug


  def generate_slug
    original_slug = slug_candidate = self.title.to_slug

    post = Post.find_by(slug: slug_candidate)
    n = 2;
    while post && post != self
      slug_candidate = original_slug + "-#{n}"
      post = Post.find_by(slug: slug_candidate)
      n += 1
    end

    self.slug = slug_candidate
  end

  def to_param
    self.slug
  end

end
