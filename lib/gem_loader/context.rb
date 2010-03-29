require File.expand_path("../scope", __FILE__)
require File.expand_path("../gem_requirement", __FILE__)
require File.expand_path("../gem", __FILE__)
require File.expand_path("../context/dsl", __FILE__)

module GemLoader
  class Context
    attr_accessor :scopes, :gem_requirements
    
    def initialize
      self.scopes = {}
      self.gem_requirements = {}
    end
    
    def scope(name)
      self.scopes[name] ||= Scope.new(self, name)
    end
    
    def gem_requirement(name)
      self.gem_requirements[name] ||= GemRequirement.new(name)
    end
    
    
    def load(*args)
      scope_names = [ args ].flatten
      scope_names.each do |scope_name|
        self.scope(scope_name).load
      end
    end
    
    def require(*args)
      scope_names = [ args ].flatten
      self.load(scope_names)
      
      scope_names.each do |scope_name|
        self.scope(scope_name).require
      end
    end
  end
  
  def self.instance
    @instance ||= Context.new
  end
  
  def self.method_missing(sym, *args, &block)
    self.instance.send(sym, *args, &block)
  end
  
  # don't use method_missing, rails looks like will be append require method on module
  def self.require(*args, &block)
    self.instance.require(*args, &block)
  end
end