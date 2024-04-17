# frozen_string_literal: true

module LitestreamRails
  class Engine < ::Rails::Engine
    isolate_namespace LitestreamRails

    config.litestream_rails = ActiveSupport::OrderedOptions.new

    initializer "litestream_rails.config" do
      config.litestream_rails.each do |name, value|
        LitestreamRails.public_send(:"#{name}=", value)
      end
    end
  end
end
