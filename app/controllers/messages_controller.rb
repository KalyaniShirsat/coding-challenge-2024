class MessagesController < ApplicationController
    def create
        @message = Message.new(message_params)
        if current_user.doctor?
            @message.doctor = current_user
        else
            @message.user = current_user
        end
        if @message.save
            redirect_to orders_path
        else
            flash[:error] = "Message failed to send: #{@message.errors.full_messages.join(", ")}"
            redirect_to orders_path
        end
    end

    private

    def message_params
        params.require(:message).permit(:message, :order_id, :user_id)
    end
end