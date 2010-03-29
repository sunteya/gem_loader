require "spec_helper"

describe GemLoader::Gem do

  before(:each) do
    gem_requirement = GemLoader::GemRequirement.new("foo")
    @foo_gem = GemLoader::Gem.new("foo", gem_requirement)
    @foo_gem2 = GemLoader::Gem.new("foo", gem_requirement)
  end
  
  describe "should load and require by" do
    it "name only" do
      Kernel.should_receive(:gem).with("foo")
      Kernel.should_receive(:require).with("foo")
    end

    it "name and version" do
      @foo_gem.parse_args("0.1")
      @foo_gem2.parse_args(">= 0.2")
      
      Kernel.should_receive(:gem).with("foo", "0.1", ">= 0.2")
      Kernel.should_receive(:require).with("foo")
    end

    it "with require lib" do
      @foo_gem.parse_args("~> 2.3.5", :require => ["action_pack", "action_view", "action_controller"])
      
      Kernel.should_receive(:gem).with("foo", "~> 2.3.5")
      Kernel.should_receive(:require).with("action_pack")
      Kernel.should_receive(:require).with("action_view")
      Kernel.should_receive(:require).with("action_controller")
    end
    
    it "skip require" do
      @foo_gem.parse_args("0.1", :require => nil)
      
      Kernel.should_receive(:gem).with("foo", "0.1")
      Kernel.stub!(:require).and_raise("fail")
    end
    
    after(:each) do
      @foo_gem.load
      @foo_gem.require
    end
  end
  
end