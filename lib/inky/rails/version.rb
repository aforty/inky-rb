module Inky
  module Rails
    VERSION = '1.4.3.0'.freeze
  end
  NODE_VERSION, GEM_VERSION = Rails::VERSION.rpartition('.').map(&:freeze)
end
