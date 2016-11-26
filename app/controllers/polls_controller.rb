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
    @item_a = @poll.poll_items.new(url: params[:url_a])
  	@item_b = @poll.poll_items.new(url: params[:url_b])
  	
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
