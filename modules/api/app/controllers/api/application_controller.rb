require 'aliwal/handler/send'

module Api
  class ApplicationController < ActionController::Base
    skip_before_filter :verify_authenticity_token

    include Aliwal::Handler::Send
  end
end
