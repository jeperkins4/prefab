class ApiGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def generate_api
    copy_file "api_base.rb", "app/services/api/base.rb"
    template "api.rb", "app/services/api/#{file_name.underscore}.rb"
  end

  def generate_controller
    generate "scaffold_controller API::V1::#{file_name.camelize} --skip-assets --skip-template-engine --skip-helper --skip-jbuilder"
  end

  def generate_rspec
    template "api_spec.rb", "spec/services/api/#{file_name.underscore}_spec.rb"
  end
end

