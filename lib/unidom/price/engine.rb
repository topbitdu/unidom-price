module Unidom
  module Price

    class Engine < ::Rails::Engine

      isolate_namespace ::Unidom::Price

      initializer :append_migrations do |app|
        config.paths['db/migrate'].expanded.each { |expanded_path| app.config.paths['db/migrate'] << expanded_path } unless app.root.to_s.match root.to_s
      end

    end

  end
end
