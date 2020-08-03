require "rails/generators/resource_helpers"
module Vue
  module Generators
    class VueRouterGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      source_root File.expand_path("../templates", __FILE__)
      def the_api_init
        unless File.exist?(Rails.root.join("app/javascript/packs/router", "index.js"))
            template "router.js", "app/javascript/packs/router/index.js"
        end 
      end

      def import_page_for_router
        sentinel = /const routes\s*=\s*\[\s*/m
        content = %Q{{
                path: '/#{controller_file_path}',
                name: '#{ class_name }',
                component: () =>
                import(/* webpackChunkName: "about" */ '../views/#{ controller_file_path }/index.vue') 
            },}
        log :import_router_page, controller_file_path
        inject_into_file "app/javascript/packs/router/index.js", content, after: sentinel, verbose: false, force: false
      end

      def rails_route
        sentinel = /scope '\/api'\s* do\n*/m
        content = "     resources :#{controller_file_path}\n"
        log :route, content
        inject_into_file "config/routes.rb", content, after: sentinel, verbose: false, force: false
      end
    end
  end
end