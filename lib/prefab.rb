require 'rails'

module Prefab
  module Generators
    class Engine < ::Rails::Engine
      config.app_generators.stylesheets false

      initializer 'prefab.setup', group: :all do |app|
        #app.config.less.paths << ::File.expand_path('../../vendor/twitter/bootstrap/less', __FILE__) if app.config.respond_to?(:less)
        #app.config.assets.paths << ::File.expand_path('../../vendor/twitter/bootstrap/sass', __FILE__) if app.config.respond_to?(:sass)

        #app.config.assets.paths << ::Rails.root.join('app', 'assets', 'fonts')

        #app.config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
      end
    end
  end
end
