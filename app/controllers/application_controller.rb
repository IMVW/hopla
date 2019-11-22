class ApplicationController < ActionController::Base
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
