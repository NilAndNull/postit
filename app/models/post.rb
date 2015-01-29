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
#
# Indexes
#
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

end
