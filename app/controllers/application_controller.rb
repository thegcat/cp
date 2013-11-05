class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  include Roar::Rails::ControllerAdditions

  before_filter :set_representer_config

  # Copied from https://github.com/apotonick/roar-rails/pull/54
  def set_representer_config
    url_options = Rails.configuration.representer.default_url_options || {}
    url_options[:protocol] ||= request.protocol
    url_options[:host]     ||= request.host
    url_options[:port]     ||= request.port unless request.port == 80
    Rails.configuration.representer.default_url_options = url_options
  end
end
