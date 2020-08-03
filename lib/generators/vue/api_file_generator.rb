require "rails/generators/resource_helpers"
module Vue
  module Generators
    class ApiFileGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      source_root File.expand_path("../templates", __FILE__)
      # def the_api_init
      #   unless File.exist?(Rails.root.join("app/javascript/packs/api", "index.js"))
      #     create_file "app/javascript/packs/api/index.js", 'export default {}'
      #   end 
      #   unless File.exist?(Rails.root.join("app/javascript/packs/api", "methods.js"))
      #     copy_file 'methods.js', "app/javascript/packs/api/methods.js"
      #   end 
      # end

      def copy_api_file
        log :copy_api, controller_file_path
        template "javascript/api.js", "app/javascript/packs/api/res/#{controller_file_path}.js"
      end

      def write_import_api_form_index
        sentinel = /export default\s*{\s*/m
        content = "import #{controller_file_path} from './res/#{controller_file_path}' \n"
        log :import_api, content
        inject_into_file "app/javascript/packs/api/index.js", content, before: sentinel, verbose: false, force: false
      end
      def write_export_api
        sentinel = /export default\s*{\n*/m
        content = "#{controller_file_path},\n"
        log :export_api, controller_file_path
        inject_into_file "app/javascript/packs/api/index.js", content, after: sentinel, verbose: false, force: false
      end
      def write_components
        sentinel = /<template>\s*\n*<ul>\s*\n*/m
        content = "<li><router-link to='/#{controller_file_path}'>#{controller_file_path.capitalize}</router-link></li>\n"
        log :add_components, controller_file_path
        inject_into_file "app/javascript/packs/components/SideBar.vue", content, after: sentinel, verbose: false, force: false
      end
    end
  end
end