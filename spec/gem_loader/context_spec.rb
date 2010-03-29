require "spec_helper"

describe GemLoader::Context do
  
  it "should be build scope successful" do
    scope = @context.scope("name")
    @context.scope("name").should == scope
    
    scope2 = @context.scope("name") # reinvoke
    scope.should == scope2
  end
  
  it "should be build gem requirement successful" do
    gem_requirement = @context.gem_requirement("name")
    @context.gem_requirement("name").should == gem_requirement
    
    gem_requirement2 = @context.gem_requirement("name") # reinvoke
    gem_requirement.should == gem_requirement2
  end
  
end