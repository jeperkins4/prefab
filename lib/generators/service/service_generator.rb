class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def generate_service
    template "service.rb", "app/services/#{file_name.underscore}.rb"
  end

  def generate_rspec
    template "service_spec.rb", "spec/services/#{file_name.underscore}_spec.rb"
  end
end
