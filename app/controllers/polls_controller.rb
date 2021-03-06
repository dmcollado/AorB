class PollsController < ApplicationController
  before_action :set_poll, except: [:new, :create, :index]
  
  def new
  	@poll = Poll.new
    if current_user
      @polls = Poll.where(user_id: current_user.id)
      @votes = Vote.where(user_id: current_user.id)
    end
  	@item_a = @poll.poll_items.new
  	@item_b = @poll.poll_items.new
  end

  def show
    if current_user
      @polls = Poll.where(user_id: current_user.id)
      @votes = Vote.where(user_id: current_user.id)
    end
    @vote = Vote.new
    @votes = Vote.all
    @votes_a = Vote.where(poll_id: @poll.id, vote: true)
    @votes_b = Vote.where(poll_id: @poll.id, vote: false)
    @can_vote = !cookies["poll_#{@poll.id}"]
  end

  def create
    if !current_user
      @user = User.new(id: 1, name: "anon")
    else
      @user = current_user
    end
    @expiration = 100
  	@poll = Poll.new(user_id: @user.id, expiration: @expiration)
    @poll.save

    # Check if params contains 'url' or 'avatar' params to create poll_items, then create poll_items accordingly...
    if params[:url_a].present?
      @item_a = @poll.poll_items.new(url: params[:url_a])
    elsif params[:poll][:avatar_a].present?
      @item_a = @poll.poll_items.new(avatar_a: params[:poll][:avatar_a])
    else
      "Something went wrong."
    end
    if params[:url_b].present?
      @item_b = @poll.poll_items.new(url: params[:url_b])
    elsif params[:poll][:avatar_b].present?
      @item_b = @poll.poll_items.new(avatar_b: params[:poll][:avatar_b])
    else
      "Something went wrong."
    end

  	respond_to do |format|
      if @poll.save! && @item_a.save! && @item_b.save!
        # format.html { redirect_to poll_path }
        format.html { redirect_to @poll, notice: 'Your poll was successfully created.' }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @user = current_user
    @polls = Poll.where(user_id: current_user.id)
  end

  def destroy
  end

  private

    def set_user
      if @user == nil
        @user = User.find_by(name: "anon")
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find_by_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require().permit(:url_a, :url_b, :description, :avatar)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require().permit(:url_a, :url_b, :description, :avatar, :poll_id, :slug)
    end

end
