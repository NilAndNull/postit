module CastVotes
  extend ActiveSupport::Concern

  private

  def cast_vote(voteable)
    session[:voteable_type] = voteable.class.name
    return Vote.create(value: params[:value], creator: current_user, voteable: voteable)
  end

end