require "spec_helper"

describe "GemLoader" do
  it "should be setup test environment successful" do
    defined?(::GemLoader).should_not be_nil
  end
end