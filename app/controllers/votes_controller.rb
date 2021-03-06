class VotesController < ApplicationController
  before_action :set_poll, except: [:by_user]

  def create

  	if !current_user
      @user = User.find_by(name: "anon")
    else
      @user = current_user
    end

    @vote = Vote.new(vote: params[:vote], user_id: @user.id, poll_id: params[:poll_id])

    if !cookies["poll_#{params[:poll_id]}"]
      respond_to do |format|
        if @vote.save
          cookies["poll_#{params[:poll_id]}"] = true

          #Grab the vote count totals and pass them as JSON for AJAX call 
          vote_count_a = Vote.where(poll_id: @poll.id, vote: true).length
          vote_count_b = Vote.where(poll_id: @poll.id, vote: false).length

          format.html { redirect_to poll_path(id: params[:poll_id]), notice: 'Your vote was successfully logged.' }
          format.json { render json: {is_success: true, vote_count_a: vote_count_a, vote_count_b: vote_count_b }}
        else
          format.html { redirect_to @poll, notice: 'Your vote was NOT logged for some odd reason. Try again.' }
        end
      end
    end
  end

  def by_user
    @user = current_user
    @votes = Vote.where(user_id: current_user.id)
  end

  private

    def set_poll
      @poll = Poll.find(params[:poll_id])
    end

end
