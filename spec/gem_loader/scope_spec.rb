require "spec_helper"

describe GemLoader::Scope do
  
  before(:each) do
    @scope = GemLoader::Scope.new("test")
  end
  
  it "should require by gem and libs" do
    @scope.gems << GemLoader::Gem.new("foo")
    @scope.libs << [ "bar", "biz" ]
    
    Kernel.should_receive(:require).with("foo")
    Kernel.should_receive(:require).with("bar")
    Kernel.should_receive(:require).with("biz")
    
    @scope.require
  end
  
  
  describe "Dsl" do
    before(:each) do
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
end