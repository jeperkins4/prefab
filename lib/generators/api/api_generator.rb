class ApiGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def generate_api_file
    template "api.rb", "lib/#{file_name.underscore}.rb"
  end

  def generate_report_spec_file
    template "api_spec.rb", "spec/lib/#{file_name.underscore}_spec.rb"
  end
end
