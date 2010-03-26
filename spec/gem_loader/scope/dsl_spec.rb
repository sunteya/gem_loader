require "spec_helper"

describe GemLoader::Scope::Dsl do
  
  before(:each) do
    @scope = GemLoader::Scope.new("test")
    @dsl = GemLoader::Scope::Dsl.new(@scope)
  end
  
  it "should say gem success" do
    @dsl.gem(:foo)
    @scope.gems.last.name.should == "foo"
  end
  
  it "should say require success" do
    @dsl.require("bar")
    @scope.libs.last.should == [ "bar" ]
  end
end