class PollsController < ApplicationController
  before_action :set_poll, except: [:new, :create]
  
  def new
  	@poll = Poll.new
  	@item_a = @poll.poll_items.new
  	@item_b = @poll.poll_items.new
  end

  def show

  end

  def create
    if @user == nil
      @user = User.new(name: "David", email: "me@me.com")
      @user.save!
    end

  	@poll = Poll.new(description: params[:description], user_id: @user.id)
    @poll.save

    # Check if params has 'url' or 'avatar' params to create poll_items, then act accordingly...
    if params[:url_a].present?
      @item_a = @poll.poll_items.new(url: params[:url_a])
    elsif params[:poll][:avatar_a].present?
      @item_a = @poll.poll_items.new(avatar_a: params[:poll][:avatar_a])
    else
      "You fucked up!"
    end
    if params[:url_b].present?
      @item_b = @poll.poll_items.new(url: params[:url_b])
    elsif params[:poll][:avatar_b].present?
      @item_b = @poll.poll_items.new(avatar_b: params[:poll][:avatar_b])
    else
      "You fucked up!"
    end
  	
  	respond_to do |format|
      if @poll.save! && @item_a.save! && @item_b.save!
        format.html { redirect_to @poll, notice: 'Your poll was successfully created.' }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require().permit(:url_a, :url_b, :description, :avatar)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require().permit(:url_a, :url_b, :description, :avatar)
    end

end
