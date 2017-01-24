require 'spec_helper'

describe <%= file_name.camelize %> do
  context 'basic' do
    user = OpenStruct.new(name: "Rubyist")
    typeform = file_name.camelize.build(user)
  end
end
