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
      @gem = GemLoader::Gem.new("foo", "0.1", :require => "lib")
      Kernel.should_receive(:gem).with("foo", "0.1")
      Kernel.stub!(:require).with("lib")
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