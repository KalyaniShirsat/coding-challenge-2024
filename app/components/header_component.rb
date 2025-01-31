require "view_component"

class HeaderComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end
end
