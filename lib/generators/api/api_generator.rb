class ApiGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def generate_api
    template "api_controller.rb", "app/controllers/api/v1/#{file_name.underscore}_controller.rb"
    template "api.rb", "app/services/api/#{file_name.underscore}.rb"
  end

  def generate_rspec
    template "firebase_spec.rb", "spec/services/firebase/#{file_name.underscore}_spec.rb"
  end
end

