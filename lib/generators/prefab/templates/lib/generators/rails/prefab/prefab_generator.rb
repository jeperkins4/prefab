class Rails::PrefabGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  class_option :coffeescript, :type => :boolean, :default => true, :desc => 'Include Coffeescript file'

  def generate_coffeescript
    template "javascript.js.coffee", "app/assets/javascripts/#{file_name.underscore}.js.coffee" if options.coffeescript?
  end

  def copy_base_file
    copy_file "base_datatable.rb", "app/datatables/base_datatable.rb"
  end

  def create_datatable_file
    create_file "app/datatables/#{file_name}_datatable.rb", <<-FILE
class #{class_name}Datatable < BaseDatatable
  delegate :current_user, :edit_#{class_name.singularize.downcase}_path, to: :@view

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
    #{plural_name} = #{class_name.singularize}.unscoped.select(columns).order(sort_column sort_direction)
    #{plural_name} = #{plural_name}.page(page_count).per(per_page)
  end

  def columns
    ['#{plural_name}.name']
  end

  def sort_column
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

  def links(obj)
    html = []
    html << link_to(t('edit').html_safe, edit_#{class_name.singularize.downcase}_path(obj), :class => 'btn btn-default btn-sm')
    if can?(:manage, obj)
      html << link_to(t('destroy').html_safe, obj, :method => :delete, :data => { :confirm => 'Are you sure?' }, :class => 'btn btn-sm btn-danger')
    end
    content_tag('div',html.join(' ').html_safe,:class => 'buttons')
  end
end
    FILE
  end
end
