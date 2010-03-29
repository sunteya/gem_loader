require File.expand_path("../../depends.rb", __FILE__)
require "gem_loader"

GemLoader.require(:test)


Spec::Runner.configure do |config|
  
  config.before(:each) do
    @context = GemLoader::Context.new
    GemLoader.stub!(:instance).and_return(@context)
  end
  
end