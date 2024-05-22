
require 'active_support'
require 'active_support/rails'
require 'active_support/concern'

require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
loader.setup

module Userstamp
  # Retrieves the configuration for the userstamp gem.
  # @return [Userstamp::Configuration]
  def self.config
    Configuration
  end

  # Configures the gem.
  # @yield [Userstamp::Configuration] The configuration for the gem.
  def self.configure
    yield config
  end
end

require 'userstamp/railtie' if defined?(Rails::Railtie)
