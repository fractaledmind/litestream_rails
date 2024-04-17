# frozen_string_literal: true

require_relative "lib/litestream_rails/version"

Gem::Specification.new do |spec|
  spec.name = "litestream_rails"
  spec.version = LitestreamRails::VERSION
  spec.authors = ["Stephen Margheim"]
  spec.email = ["stephen.margheim@gmail.com"]

  spec.summary = "Rails integration for Litestream."
  spec.homepage = "https://github.com/fractaledmind/litestream_rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/fractaledmind/litestream_rails"
  spec.metadata["changelog_uri"] = "https://github.com/fractaledmind/litestream_rails/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "litestream", "~> 0.5.3"
  "~> 7.0".tap do |rails_version|
    spec.add_dependency "actionpack", rails_version
    spec.add_dependency "actionview", rails_version
    spec.add_dependency "activesupport", rails_version
    spec.add_dependency "railties", rails_version
  end

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
