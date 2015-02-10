# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  slug            :string
#
# Indexes
#
#  index_users_on_slug      (slug) UNIQUE
#  index_users_on_username  (username) UNIQUE
#

class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_secure_password

  validates :username, uniqueness: true
  validates :password, length: {minimum: 5}, on: :create

  before_save :generate_slug


  def generate_slug
    original_slug = slug_candidate = self.username.to_slug

    user = User.find_by(slug: slug_candidate)
    n = 2;
    while user && user != self
      slug_candidate = original_slug + "-#{n}"
      user = User.find_by(slug: slug_candidate)
      n += 1
    end

    self.slug = slug_candidate
  end

  def to_param
    self.slug
  end
end
