# frozen_string_literal: true

ENV["RAILS_ENV"] = "test"

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require_relative "../test/dummy/config/environment"
require "rails/test_help"
require "litestream_rails"

require "minitest/autorun"
