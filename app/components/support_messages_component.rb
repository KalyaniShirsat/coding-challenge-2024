class SupportMessagesComponent < ViewComponent::Base
  def initialize(messages)
    @messages = messages
  end

  def render
    render(SupportMessagesComponent.with_collection(@messages))
  end
end
