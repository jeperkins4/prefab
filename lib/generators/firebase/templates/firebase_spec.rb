require 'rails_helper'

describe <%= file_name.camelize %> do
  let!(:<%= class_name.downcase.underscore %>) { Fabricate(:<%= class_name.downcase.underscore %>) }

  context 'basic' do
  end
end
