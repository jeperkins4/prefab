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
    <%= plural_name %> = <%= class_name.singularize %>.unscoped.select(columns).order(order_by(columns))

    if params[:sSearch].present?
      <%= plural_name %> = <%= plural_name %>.where('<%= plural_name %>.name like :search', search: "%#{params[:sSearch]}%")
    end
    <%= plural_name %> = <%= plural_name %>.page(page_count).per(per_page)
  end

  def columns
    ['<%= plural_name %>.name', '<%= plural_name %>.id']
  end

  def exceptions
    ['<%= plural_name %>.id']
  end
end
