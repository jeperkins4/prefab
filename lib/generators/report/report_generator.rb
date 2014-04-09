class ReportGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :class_name, type: :string

  def generate_report_file
    template "report.rb", "lib/reporting/#{file_name.underscore}.rb"
  end

  def generate_report_spec_file
    template "report_spec.rb", "spec/lib/reporting/#{file_name.underscore}_spec.rb"
  end
end
