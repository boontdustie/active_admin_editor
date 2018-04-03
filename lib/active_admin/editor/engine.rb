module ActiveAdmin
  module Editor
    class Engine < ::Rails::Engine
      engine_name 'active_admin_editor'

      ActiveAdmin.application.class_eval do
        def editor; ActiveAdmin::Editor.configuration end
      end

      initializer 'active_admin.editor', :group => :all do |app|
        app.config.assets.precompile += [
          'active_admin/editor.js',
          'active_admin/editor.css'
        ] + ActiveAdmin::Editor.configuration.stylesheets
      end
    end
  end
end
