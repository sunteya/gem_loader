require "spec_helper"

describe GemLoader::Base::Dsl do
  
  before(:each) do
    @base = GemLoader::Base.new
    @dsl = GemLoader::Base::Dsl.new(@base)
  end
  
  it "should say scope success" do
    @dsl.scope(:foo)
    @base.scopes[:foo].should_not be_nil
  end
  
  it "should say scope with depends" do
    @dsl.scope(:foo => [:bar])
    @base.scopes[:bar].should_not be_nil
    @base.scopes[:foo].depend_scopes.should be_include @base.scopes[:bar]
  end
end