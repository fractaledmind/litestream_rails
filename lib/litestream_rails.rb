# frozen_string_literal: true

require_relative "litestream_rails/version"
require_relative "litestream_rails/engine"
require "litestream"

module LitestreamRails
  mattr_writer :username
  mattr_writer :password

  class << self
    # use method instead of attr_accessor to ensure
    # this works if variable set after SolidErrors is loaded
    def username
      @username ||= ENV["LITESTREAMRAILS_USERNAME"] || @@username
    end

    # use method instead of attr_accessor to ensure
    # this works if variable set after SolidErrors is loaded
    def password
      @password ||= ENV["LITESTREAMRAILS_PASSWORD"] || @@password
    end

    def databases
      databases = text_table_to_hashes(Litestream::Commands.databases(async: false))

      databases.each do |db|
        generations = text_table_to_hashes(Litestream::Commands.generations(db["path"], async: false))
        snapshots = text_table_to_hashes(Litestream::Commands.snapshots(db["path"], async: false))

        db['generations'] = generations.map do |generation|
          id = generation["generation"]
          replica = generation["name"]
          generation["snapshots"] = snapshots.select { |snapshot| snapshot["generation"] == id && snapshot["replica"] == replica }
            .map { |s| s.slice("index", "size", "created") }
          generation.slice("generation", "name", "lag", "start", "end", "snapshots")
        end
      end
    end

    private

    def text_table_to_hashes(string)
      keys, *rows = string.split("\n").map { _1.split(/\s+/) }
      rows.map { keys.zip(_1).to_h }
    end
  end
end
