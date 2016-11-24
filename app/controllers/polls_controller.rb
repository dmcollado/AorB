class PollsController < ApplicationController
  
  def new
  	@poll = Poll.new
  end

  def show
    
  end

  def create
  	@poll = Poll.new(poll_params)

  	respond_to do |format|
      if @poll.save
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

  def index
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:name)
    end

end
