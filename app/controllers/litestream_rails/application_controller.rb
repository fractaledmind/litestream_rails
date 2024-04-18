module LitestreamRails
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    around_action :force_english_locale!

    http_basic_authenticate_with name: LitestreamRails.username, password: LitestreamRails.password if LitestreamRails.password

    private

    def force_english_locale!(&action)
      I18n.with_locale(:en, &action)
    end
  end
end
