class SupportMessagesController < ApplicationController
  def create
    @message = SupportMessage.new(message_params)
    @message.sender = current_user
    @message.receiver = User.find_by(is_support: true) if !@message.receiver_id
    if @message.save
      redirect_to orders_path
    else
      flash[:error] = "Message failed to send: #{@message.errors.full_messages.join(", ")}"
      redirect_to orders_path
    end
  end

  private

  def message_params
    params.require(:support_message).permit(:message, :order_id, :receiver_id)
  end
end
