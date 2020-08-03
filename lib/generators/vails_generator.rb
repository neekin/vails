class VailsGenerator < Rails::Generators::NamedBase
    def vue 
        log :invoke, "views"
        invoke "vue:views"
        log :invoke, "vue_router"
        invoke "vue:vue_router"
        log :invoke, "api_file"
        invoke "vue:api_file"
        invoke  :scaffold 
    end
end
