module Unidom
  module Price

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace ::Unidom::Price

      enable_initializer enum_enabled: true, migration_enabled: true

    end

  end
end
