# frozen_string_literal: true

class MessageReflex < ApplicationReflex

    def create(params)
        @message = Message.new(
            message: params[:message],
            user_id: params[:user_id],
            order_id: params[:order_id]
        )
        if @message.save
            cable_ready
                .morph(
                selector: "#messages",
                html: render(MessagesComponent.new(@message.order.messages))
            )
        else
            render_error(@message.errors.full_messages.join(", "))
        end
    end

    def render_error(error)
        cable_ready.morph(
            selector: "#messages",
            html: render(MessagesComponent.new(@message.order.messages))
        )
    end

end
