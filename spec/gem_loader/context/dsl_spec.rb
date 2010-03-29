require "spec_helper"

describe GemLoader::Context::Dsl do
  
  before(:each) do
    @dsl = GemLoader::Context::Dsl.new(@context)
  end
  
  it "should say scope success" do
    @dsl.scope(:foo)
    @context.scopes[:foo].should_not be_nil
  end
  
  it "should say scope with depends" do
    @dsl.scope(:foo => [:bar])
    @context.scopes[:bar].should_not be_nil
    @context.scopes[:foo].depend_scopes.should be_include @context.scopes[:bar]
  end
end