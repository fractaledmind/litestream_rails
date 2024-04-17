module LitestreamRails
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    http_basic_authenticate_with name: LitestreamRails.username, password: LitestreamRails.password if LitestreamRails.password
  end
end
