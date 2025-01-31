module MessageConcerns
    extend ActiveSupport::Concern

    def messages
        Message.where(order_id: self.id)
    end
end
