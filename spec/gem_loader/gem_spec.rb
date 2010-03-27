require "spec_helper"

describe GemLoader::Gem do
  
  describe "should load and require by" do
    it "name only" do
      @gem = GemLoader::Gem.new("foo")
      Kernel.should_receive(:gem).with("foo")
      Kernel.should_receive(:require).with("foo")
    end

    it "name and version" do
      @gem = GemLoader::Gem.new("foo", "0.1")
      Kernel.should_receive(:gem).with("foo", "0.1")
      Kernel.should_receive(:require).with("foo")
    end

    it "with require lib" do
      @gem = GemLoader::Gem.new("actionpack", "~> 2.3.5", :require => ["action_pack", "action_view", "action_controller"])
      Kernel.should_receive(:gem).with("actionpack", "~> 2.3.5")
      Kernel.should_receive(:require).with("action_pack")
      Kernel.should_receive(:require).with("action_view")
      Kernel.should_receive(:require).with("action_controller")
    end
    
    it "skip require" do
      @gem = GemLoader::Gem.new("foo", "0.1", :require => nil)
      Kernel.should_receive(:gem).with("foo", "0.1")
      Kernel.stub!(:require).and_raise("fail")
    end
    
    after(:each) do
      @gem.load
      @gem.require
    end
  end
  
end