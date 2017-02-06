<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= file_name.camelize %>
  def initialize
  end

  def run
  end

  private
end
<% end -%>
