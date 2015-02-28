class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, :except => :index

  def index
    @messages = Message.all
    authorize Message.new
  end

  def show

  end

  def new
    @message = Message.new
    authorize @message
  end

  def create
    @message = Message.new(message_params)
    authorize @message
    @message.save

    flash[:notice] = "message has been submitted"
    respond_to do |format|
      format.html { redirect_to contact_path }
      format.json { redirect_to contact_path }
    end
  end

  def edit

  end

  def update
    @message.update(message_params)
    @message.save
    respond_to do |format|
      format.html { redirect_to @message }
      format.json { redirect_to @message }
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to @message }
      format.json { redirect_to @message }
    end
  end

  private
  def set_message
    @message = Message.find(params[:id])
    authorize @message
  end

  def message_params
    params.require(:message).permit(:name, :email, :subject, :message)
  end
end
