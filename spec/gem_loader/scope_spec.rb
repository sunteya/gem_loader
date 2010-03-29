require "spec_helper"

describe GemLoader::Scope do
  
  before(:each) do
    @scope = @context.scope(:test)
  end
  
  it "should require by gem and libs" do
    @scope.gems << GemLoader::Gem.new("foo")
    @scope.libs << [ "bar", "biz" ]
    
    Kernel.should_receive(:require).with("foo")
    Kernel.should_receive(:require).with("bar")
    Kernel.should_receive(:require).with("biz")
    
    @scope.require
  end
  
  it "should include depends scope gems" do
    depend_scope = @context.scope("depend")
    depend_scope.gems << GemLoader::Gem.new("depend_gem")
    @scope.gems << GemLoader::Gem.new("test_gem")
    @scope.depend_scopes << depend_scope
    
    @scope.all_gems.should == [ depend_scope.gems + @scope.gems ].flatten
  end
end