class MessagesComponent < ViewComponent::Base
  def initialize(messages)
    @messages = messages
  end

  def render
    render(MessageComponent.with_collection(@messages))
  end
end