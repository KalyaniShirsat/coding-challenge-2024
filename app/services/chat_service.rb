class ChatService
  def initialize(order)
    @order = order
  end

  def messages
    @order.messages
  end

  def send_message(to:, from:, message:)
    if to.is_a?(User)
      Message.create(user_id: to.id, doctor_id: from.id, order_id: @order.id, message: message)
    elsif to.is_a?(Doctor)
      Message.create(user_id: from.id, doctor_id: to.id, order_id: @order.id, message: message)
    end

    if from.is_a?(User)
      Message.create(user_id: from.id, doctor_id: to.id, order_id: @order.id, message: message)
    elsif from.is_a?(Doctor)
      Message.create(user_id: to.id, doctor_id: from.id, order_id: @order.id, message: message)
    end
  end
end
