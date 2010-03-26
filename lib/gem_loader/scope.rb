require File.expand_path("../scope/dsl", __FILE__)

module GemLoader
  class Scope
    attr_accessor :name, :depend_scopes, :gems, :libs
    
    def initialize(name, depend_scopes = [])
      self.name = name
      self.depend_scopes = depend_scopes
      self.gems = []
      self.libs = []
    end
    
    def all_gems
      [ self.depend_scopes.map(&:all_gems) + self.gems ].flatten
    end
    
    def load
      self.all_gems.each do |gem|
        gem.load
      end
    end
    
    def require
      self.all_gems.each do |gem|
        gem.require
      end
      
      self.libs.flatten.each do |lib|
        Kernel.send :require, lib.to_s
      end
    end
    
    def gem(name, version, options)
      (self.gems ||= []) << Gem.new(name, version, options)
      self.gems.last
    end
    
  end
end
