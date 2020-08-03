module Vue
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      def remove_default_file
        remove_file 'app/javascript/app.vue'
        remove_file 'app/javascript/packs/application.js'
        remove_file 'app/javascript/packs/hello_vue.js'
      end
      def the_api_init
        unless File.exist?(Rails.root.join("app/javascript/packs/api", "index.js"))
          create_file "app/javascript/packs/api/index.js", 'export default {}'
        end 
        unless File.exist?(Rails.root.join("app/javascript/packs/api", "methods.js"))
          copy_file 'javascript/methods.js', "app/javascript/packs/api/methods.js"
          copy_file 'javascript/main.js', "app/javascript/packs/main.js"
          copy_file 'javascript/router.js', "app/javascript/packs/router/index.js"
          copy_file 'javascript/store.js', "app/javascript/packs/store/index.js"
          copy_file 'javascript/app.vue', "app/javascript/packs/app.vue"
          copy_file 'javascript/SideBar.vue', "app/javascript/packs/components/SideBar.vue"
          copy_file 'javascript/scaffold.scss', "app/javascript/packs/assets/scss/scaffold.scss"
        end
        unless File.exist?(Rails.root.join("app/views/layouts", "application.html.erb"))
          copy_file 'application.html.erb', "app/views/layouts/application.html.erb"
          copy_file 'index.html.erb', "app/views/welcome/index.html.erb"
          copy_file 'welcome_controller.rb', "app/controllers/welcome_controller.rb"
        end 
      end


      def change_wepacker_config
        copy_file 'javascript/resolve.js', "config/webpack/resolve.js"
      end
      def change_webpack_config_env
        inject_into_file "config/webpack/environment.js", "\nconst resolvePath = require('./resolve')", after: "const vue = require('./loaders/vue')", verbose: false, force: false
        inject_into_file "config/webpack/environment.js", "environment.config.merge(resolvePath)\n", before: "environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())", verbose: false, force: false
      end
      def change_config_routus
        content = %Q{  scope '/api' do
  end
  root 'welcome#index'
  get  '/*path', to: 'welcome#index' , format: false
}
        inject_into_file "config/routes.rb", content, after: "# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html\n", verbose: false, force: false
      end
    end
  end
end