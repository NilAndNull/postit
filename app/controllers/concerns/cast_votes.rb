module CastVotes
  extend ActiveSupport::Concern

  private

  def cast_vote(voteable)
    Vote.create(value: params[:value], creator: current_user, voteable: voteable)
  end

end