class Firebase::<%= file_name.camelize %> < Firebase::Base
  attr_accessor :<%= file_name.downcase.underscore %>, :client

  def initialize(<%= file_name.downcase.underscore %>)
    self.client = super
    self.<%= file_name.downcase.underscore %> = <%= file_name.downcase.underscore %>
  end

  def send(message)
    msg = client.put("<%= file_name.downcase.underscore %>s/#{self.<%= file_name.downcase.underscore %>.id}", <%= file_name.downcase.underscore %>.to_json )
    p msg
    @reconnect = false
    es = client.event_source("<%= file_name.downcase.underscore %>s/#{self.<%= file_name.downcase.underscore %>.id}")
    es.close
    return msg
  end
end
