class MessagesController < ApplicationController
  def index
    @messagee = Messagee.new
    @room = Room.find(params[:room_id])
    @messagees = @room.messagees.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @messagee = @room.messagees.new(messagee_params)
    if @messagee.save
      redirect_to room_messagees_path(@room)
    else
      @messagees = @room.messagees.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def messagee_params
    params.require(:messagee).permit(:content).merge(user_id: current_user.id)
  end
end
