module <%= file_name.camelize %>
  class API
    def initialize
      @key = APP[:<%= file_name.camelize %>][:key]
      @base_url = ""
    end
  end
end
