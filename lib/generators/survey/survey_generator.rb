class SurveyGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def generate_survey
    template "survey.rb", "app/surveys/#{file_name.underscore}.rb"
  end

  def generate_rspec
    template "survey_spec.rb", "spec/surveys/#{file_name.underscore}_spec.rb"
  end
end
