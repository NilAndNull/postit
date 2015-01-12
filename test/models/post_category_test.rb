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

require 'test_helper'

class PostCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
