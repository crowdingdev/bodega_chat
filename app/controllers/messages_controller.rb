class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages/1
  # GET /messages/1.json
  def show; end

  def new
    @message = Message.new
  end

  def edit; end

  def create
    @message = Message.create!( message_params )

    current_user.groups.find( params[:group_id] ).messages << @message
    current_user.messages << @message

    redirect_to :back
  end

  def update; end
  def destroy; end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content)
    end
end
