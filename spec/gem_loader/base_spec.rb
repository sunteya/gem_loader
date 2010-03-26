require "spec_helper"

describe GemLoader::Base do
  
  before(:each) do
    @base = GemLoader::Base.new
  end
  
  describe "Dsl" do
    
    before(:each) do
      @dsl = GemLoader::Base::Dsl.new(@base)
    end
    
    it "should say scope success" do
      @dsl.scope(:foo)
      @base.scopes[:foo].should_not be_nil
    end
  end
end