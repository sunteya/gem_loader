# GemLoader

  A tiny gem's dependencies loader.

## Install

	gem install gem_loader

## Usege

### Manage you gem's dependencies

You need to create a gem's dependencies file, such as "depends.rb" or any other .

	require "rubygems"
	gem "gem_loader", ">= 0.1.0"
	require "gem_loader"


	GemLoader.setup do
	
	  scope :runtime do
	    gem "sinatra", "1.0"
	  end

	  scope :optional
	  
	  scope :test do
	    gem "rspec", ">= 1.3.0", :require => nil
	  end
	
	  scope :development => [ :optional, :test ]
  
	  scope :rakefile do
	    gem "rake", ">= 0.8.7"
	    gem "jeweler", ">= 1.4.0"
	    
	    gem "rspec", :require => "spec/rake/spectask"   # '>= 1.3.0' version shared at :test scope
	    
	  end
	end

Modify all boot file and use the scope initialize GemLoader (such as `Rakefile`, `spec_helper.rb` and so on)

	require File.expand_path("../depends.rb", __FILE__)
	GemLoader.require(:rakefile) # :rakefile can be replace any you define scopes

### Integrate Gem specification

now you can integrate the gem's dependencies into the gem specification.

	GemLoader.gemspec.integrate(spec)

It will search `runtime` and `development` scope, and be integrated into the gem specification.

example for Jeweler

	Jeweler::Tasks.new do |spec|
	  spec.name = "gem_name"
	  spec.summary = "gem_summary"
	  spec.email = "email@host.com"
	  spec.homepage = "http://host.com/homepage"
	  spec.authors = ["author"]
	  GemLoader.gemspec.integrate(spec)
	end
	Jeweler::GemcutterTasks.new

## TODO

  * Add a rake or CLI support, used to view the dependencies
