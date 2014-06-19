require 'spec_helper'

describe <%= class_name %> do
  let(:<%= class_name.underscore %>) { Fabricate(:<%= class_name.underscore %>) }

  context 'delegation' do
<% attributes.select {|attr| attr.reference? }.each do |attribute| -%>
    it "should delegate association" do
      <%= class_name.underscore %>.<%= attribute.name %>_name.should be 
    end
<% end -%>
  end
end
