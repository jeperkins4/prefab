class DatatableGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :coffeescript, :type => :boolean, :default => true, :desc => 'Include Coffeescript file'

  def generate_coffeescript
    template "javascript.js.coffee", "app/assets/javascripts/#{file_name.underscore}.js.coffee" if options.coffeescript?
  end

  def create_datatable_file
    template "datatable.rb", "app/datatables/#{file_name}_datatable.rb" 
  end
end
