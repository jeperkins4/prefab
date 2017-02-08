class API::V1::<%= file_name.camelize %>Controller < ApplicationController
  respond_to :json

  expose(:<%= file_name.pluralize %>) {  <%= file_name.camelize %>.all(<%= class_name %>) }
  expose(:<%= file_name.singularize %>) { params[:id].present? ? <%= class_name %>.find(params[:id]) : <%= class_name %>.new(params[:<%= file_name.singularize %>]) }

  def index
  end

  def create
    respond_with(:api, :v1, <%= file_name.singularize %>) if <%= file_name.singularize %>.save
  end

  def update
    respond_with(:api, :v1, <%= file_name.singularize %>) if <%= file_name.singularize %>.update(<%= "#{singular_table_name}_params" %>)
  end

  def destroy
    <%= file_name %>.destroy
  end

  private
    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_table_name}_params" %>
      params.require(:<%= singular_table_name %>).permit(:name)
    end
end
