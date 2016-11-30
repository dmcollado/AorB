class VotesController < ApplicationController
  before_action :set_poll

  def create

  	@user = User.find_by(name: "anon")
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

  private

    def set_poll
      @poll = Poll.find(params[:poll_id])
    end

end
