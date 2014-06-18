class BaseDatatable
  delegate :can?, :content_tag, :current_user, :current_agency, :params, :h, :l, :t, :status_tag, :link_to, :class, to: :@view

  def initialize(view)
    @view = view
  end

private
  def page_count
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
