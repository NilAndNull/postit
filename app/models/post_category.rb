# == Schema Information
#
# Table name: post_categories
#
#  id          :integer          not null, primary key
#  post_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_post_categories_on_category_id  (category_id)
#  index_post_categories_on_post_id      (post_id)
#

class PostCategory < ActiveRecord::Base
  belongs_to :post
  belongs_to :category
end
