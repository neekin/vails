require "rails/generators/resource_helpers"

module Vue # :nodoc:
    module Generators # :nodoc:
        class ViewsGenerator < Rails::Generators::NamedBase
              source_root File.expand_path("../../../templates/vue/scaffold", __FILE__)
              include Rails::Generators::ResourceHelpers
              argument :attributes, type: :array, default: [], banner: "field:type field:type"
              def create_root_folder
                empty_directory File.join("app/javascript/packs/views", controller_file_path)
              end
              def copy_view_files
                available_views.each do |view|
                  formats.each do |format|
                    filename = filename_with_extensions(view, format)
                    template filename, File.join("app/javascript/packs/views", controller_file_path, filename)
                  end
                end
              end

            private
              def available_views
                %w(index edit show new _form)
              end

              def formats
                [format]
              end
      
              def format
                :vue
              end
      
              def filename_with_extensions(name, file_format = format)
                [name, file_format].compact.join(".")
              end
        end
    end
  end