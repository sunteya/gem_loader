require File.expand_path("../scope", __FILE__)
require File.expand_path("../gem", __FILE__)
require File.expand_path("../base/dsl", __FILE__)

module GemLoader
  class Base
    attr_accessor :scopes
    
    def initialize
      self.scopes = {}
    end
    
    def scope(name, depend_scopes = [])
      self.scopes ||= {}
      self.scopes[name] ||= Scope.new(name, depend_scopes)
    end
    
    def setup(&block)
      self.dsl(&block)
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
end