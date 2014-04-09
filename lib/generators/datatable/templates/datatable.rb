class <%= class_name %>Datatable < BaseDatatable
  delegate :current_user, :edit_<%= class_name.singularize.downcase %>_path, to: :@view

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: <%= class_name.singularize %>.count,
      iTotalDisplayRecords: <%= plural_name %>.total_count,
      aaData: data
    }
  end

private
  def data
    <%= plural_name %>.map do |<%= plural_name.singularize %>|
      [
        link_to(<%= plural_name.singularize %>.name, <%= plural_name.singularize %>)
      ]
    end
  end

  def <%= plural_name %>
    @<%= plural_name %> || fetch_<%= plural_name %>
  end

  def fetch_<%= plural_name %>
    <%= plural_name %> = <%= class_name.singularize %>.unscoped.select(columns).order("#{sort_column} #{sort_direction}")

    if params[:sSearch].present?
      <%= plural_name %> = <%= plural_name %>.where('<%= plural_name %>.name like :search', search: "%#{params[:sSearch]}%")
    end
    <%= plural_name %> = <%= plural_name %>.page(page_count).per(per_page)
  end

  def columns
    ['<%= plural_name %>.name']
  end

  def sort_column
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

  def links(obj)
    html = []
    html << link_to(t('edit').html_safe, edit_<%= class_name.singularize.downcase %>_path(obj), :class => 'btn btn-default btn-xs')
    if can?(:manage, obj)
      html << link_to(t('destroy').html_safe, obj, :method => :delete, :data => { :confirm => 'Are you sure?' }, :class => 'btn btn-xs btn-danger')
    end
    content_tag('div',html.join(' ').html_safe,:class => 'buttons')
  end
end
