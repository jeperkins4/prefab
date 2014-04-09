require 'spec_helper'

describe <%= file_name.camelize %> do
  let!(:<%= class_name.snakecase %>) { Fabricate(:<%= class_name.snakecase %>) }

  context 'details' do
    it "should generate an array of report records" do
      <%= file_name.camelize %>.details.should_not be_empty 
    end
  end

  context 'export_excel' do
  end
end
