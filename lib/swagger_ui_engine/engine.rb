require 'sassc/rails'

module SwaggerUiEngine
  class Engine < ::Rails::Engine
    isolate_namespace SwaggerUiEngine

    config.to_prepare do
      Rails.application.config.assets.precompile += %w[
        swagger_ui_engine/lib/typography.css
        swagger_ui_engine/lib/reset.css
        swagger_ui_engine/lib/screen.css
        swagger_ui_engine/lib/print.css
        swagger_ui_engine/custom.css
        swagger_ui_engine/print.css
        swagger_ui_engine/logo.png
        swagger_ui_engine/favicon.png
        swagger_ui_engine/lang/*.js
        swagger_ui_engine/DroidSans-Bold.ttf
        swagger_ui_engine/DroidSans.ttf
        swagger_ui_engine/application.js
        swagger_ui_engine/application.css
      ]

      Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
    end
  end
end
