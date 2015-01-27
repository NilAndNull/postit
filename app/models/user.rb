# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#

class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments

  has_secure_password

  validates :username, uniqueness: true
end
