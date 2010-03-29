require "rubygems"
require File.expand_path("../lib/gem_loader", __FILE__)


GemLoader.setup do
  
  scope :runtime
  
  scope :optional
  
  scope :test do
    gem :rspec, ">= 1.3.0", :require => nil
  end
  
  scope :development => [:optional, :test]
  
  scope :rakefile do
    gem :rake, ">= 0.8.7"
    gem :jeweler, ">= 1.4.0"
    gem :spec, :require => "spec/rake/spectask"
  end
end