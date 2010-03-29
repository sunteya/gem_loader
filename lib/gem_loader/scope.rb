require File.expand_path("../scope/dsl", __FILE__)

module GemLoader
  class Scope
    attr_accessor :context, :name, :depend_scopes, :gems, :libs
    
    def initialize(context, name)
      self.context = context
      self.name = name
      self.depend_scopes, self.gems, self.libs = [], [], []
    end
    
    def add_depend_scope(scope)
      self.depend_scopes << scope
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
    
    def gem(name)
      gem_requirement = self.context.gem_requirement(name)
      gem = Gem.new(name, gem_requirement)
      (self.gems << gem).last
    end
    
  end
end
