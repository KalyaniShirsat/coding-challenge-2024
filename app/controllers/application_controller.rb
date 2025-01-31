class ApplicationController < ActionController::Base

    include CableReady::Broadcaster
  before_action :authenticate_user!
end
