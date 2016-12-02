class VotesController < ApplicationController
  before_action :set_poll, except: [:by_user]

  def create

  	if !current_user
      @user = User.find_by(name: "anon")
    else
      @user = current_user
    end

    @vote = Vote.new(vote: params[:vote], user_id: @user.id, poll_id: params[:poll_id])

    respond_to do |format|
      if @vote.save
        cookies["poll_#{params[:poll_id]}"] = true
        format.html { redirect_to poll_path(id: params[:poll_id]), notice: 'Your vote was successfully logged.' }
      else
        format.html { redirect_to @poll, notice: 'Your vote was NOT logged for some odd reason. Try again.' }
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
