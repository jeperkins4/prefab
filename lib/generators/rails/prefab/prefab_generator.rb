class Rails::PrefabGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :coffeescript, :type => :boolean, :default => true, :desc => 'Include Coffeescript file'

  def generate_coffeescript
    template "javascript.js.coffee", "app/assets/javascripts/#{file_name.underscore}.js.coffee" if options.coffeescript?
  end

  def create_datatable_file
    create_file "app/datatables/#{file_name}_datatable.rb", <<-FILE
class #{class_name}Datatable < BaseDatatable
  delegate :current_user, to: :@view

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: #{class_name.singularize}.count,
      iTotalDisplayRecords: #{plural_name}.total_count,
      aaData: data
    }
  end

private
  def data
    #{plural_name}.map do |#{plural_name.singularize}|
      [
        link_to(#{plural_name.singularize}.name, #{plural_name.singularize}),
        links(#{plural_name.singularize})
      ]
    end
  end

  def #{plural_name}
    @#{plural_name} || fetch_#{plural_name}
  end

  def fetch_#{plural_name}
    search_columns = ['#{plural_name}.name']
    #{plural_name} = #{class_name.singularize}.unscoped.select(columns).order(order_by(columns))
    #{plural_name} = #{plural_name}.page(page_count).per(per_page)
  end

  def columns
    %w['#{plural_name}.name']
  end

  def exceptions
    %w['#{plural_name}.id']
  end
end
    FILE
  end
end
