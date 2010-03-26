require "rubygems"
require File.expand_path("../lib/gem_loader", __FILE__)


GemLoader.setup do
  
  scope :runtime

  scope :development do
    gem :rspec, ">= 1.3.0", :require => nil
  end
  
  scope :test => [ :runtime, :development ]
  
  scope :rakefile => [ :runtime, :development ] do
    gem :rake, ">= 0.8.7"
    gem :jeweler, ">= 1.4.0"
    
    require "spec/rake/spectask"
  end
end