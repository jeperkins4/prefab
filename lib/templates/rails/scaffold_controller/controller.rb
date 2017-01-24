<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  expose(:<%= plural_table_name %>) {  <%= orm_class.all(class_name) %> }
  expose(:<%= singular_table_name %>, attributes: :<%= singular_table_name %>_params)

  def index
    respond_to do |format|
      format.html
      format.json { render json: <%= class_name.pluralize %>Datatable.new(view_context) }
    end
  end

  # POST <%= route_url %>
  # POST <%= route_url %>.json
  def create
    respond_to do |format|
      if <%= orm_instance.save %>
        format.html { redirect_to <%= singular_table_name %>, notice: <%= "'#{human_name} was successfully created.'" %> }
        format.json { render json: <%= "#{singular_table_name}" %>, status: ':created', location: <%= "#{singular_table_name}" %> }
      else
        format.html { render action: 'new' }
        format.json { render json: <%= "#{orm_instance.errors}" %>, status: ':unprocessable_entity' }
      end
    end
  end

  # PUT <%= route_url %>/1
  # PUT <%= route_url %>/1.json
  def update
    respond_to do |format|
      if <%= orm_instance.update("#{singular_table_name}_params") %>
        format.html { redirect_to <%= singular_table_name %>, notice: <%= "'#{human_name} was successfully updated.'" %> }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: <%= "#{orm_instance.errors}" %>, status: ':unprocessable_entity' }
      end
    end
  end

  # DELETE <%= route_url %>/1
  # DELETE <%= route_url %>/1.json
  def destroy
    <%= orm_instance.destroy %>

    respond_to do |format|
      format.html { redirect_to <%= index_helper %>_url }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params[:<%= singular_table_name %>]
      <%- else -%>
      params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      <%- end -%>
    end
end
<% end -%>
