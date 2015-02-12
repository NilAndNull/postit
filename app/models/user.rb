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
#  role            :string           default("user")
#  time_zone       :string
#
# Indexes
#
#  index_users_on_slug      (slug) UNIQUE
#  index_users_on_username  (username) UNIQUE
#

class User < ActiveRecord::Base
  include Sluggable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_secure_password

  validates :username, uniqueness: true
  validates :password, length: {minimum: 3}, on: :create

  sluggable :username

end
