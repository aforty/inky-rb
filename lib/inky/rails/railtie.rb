require 'sprockets/railtie'

module Inky::Rails
  class Railtie < ::Rails::Railtie
    if config.respond_to?(:annotations)
      config.annotations.register_extensions("inky") { |annotation| /<!--\s*(#{annotation}):?\s*(.*) -->/ }
    end
  end
end
