class API::V1::<%= file_name.camelize %>Controller < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json

  expose(:<%= file_name.pluralize %>) {  <%= file_name.camelize.all(class_name) %> }
  expose(:<%= file_name.singularize %>) { params[:id].present? ? <%= class_name %>.find(params[:id]) : <%= class_name %>.new(params[:<%= file_name.singularize %>]) }

  def index
  end

  # POST <%= route_url %>
  # POST <%= route_url %>.json
  def create
    respond_to do |format|
      if <%= file_name.singularize.save %>
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
