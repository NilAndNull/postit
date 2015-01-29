# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  value         :boolean
#  voteable_id   :integer
#  voteable_type :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_votes_on_user_id                                    (user_id)
#  index_votes_on_user_id_and_voteable_id_and_voteable_type  (user_id,voteable_id,voteable_type) UNIQUE
#  index_votes_on_voteable_type_and_voteable_id              (voteable_type,voteable_id)
#

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
