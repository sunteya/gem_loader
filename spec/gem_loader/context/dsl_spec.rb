require "spec_helper"

describe GemLoader::Context::Dsl do
  
  
  it "should say scope successful" do
    @context.dsl do
      scope :foo
    end
    
    @context.scope(:foo).should_not be_nil
  end
  
  it "should say scope with depend other scopes successful" do
    @context.dsl do
      scope :development => :test
    end
    
    scope = @context.scope(:development)
    scope.depend_scopes.last.should == @context.scope(:test)
  end
  
end