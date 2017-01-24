class ConcernGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def generate_concern_file
    template "concern.rb", "app/concerns/#{file_name.underscore}.rb"
  end

  def generate_spec_file
    template "concern_spec.rb", "spec/concerns/#{file_name.underscore}_spec.rb"
  end
end
