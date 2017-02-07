require 'rails_helper'

describe <%= file_name.camelize %> do
  let!(:<%= class_name.downcase.underscore %>) { Fabricate(:<%= class_name.downcase.underscore %>) }

  context 'run' do
    it "should successfully run #{fire_name}" do

    end
  end
end
