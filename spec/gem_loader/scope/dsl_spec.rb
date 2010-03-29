require "spec_helper"

describe GemLoader::Scope::Dsl do
  
  before(:each) do
    @scope = @context.scope(:test)
    @dsl = GemLoader::Scope::Dsl.new(@scope)
  end
  
  it "should say gem success" do
    @scope.dsl { gem("foo") }
    @scope.gem("foo").should_not be_nil
  end
  
  it "should say require success" do
    @dsl.require("bar")
    @scope.libs.last.should == [ "bar" ]
  end
end