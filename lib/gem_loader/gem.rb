require File.expand_path("../gem/dsl", __FILE__)

module GemLoader
  class Gem
    attr_accessor :name, :version, :options, :requires
    
    def initialize(name, version = nil, options = {})
      self.name = name.to_s
      self.version = version
      self.options = options || {}
    end
    
    def gem_args
      self.version ? [self.name, self.version] : [self.name]
    end
    
    def load
      if self.version
        Kernel.send :gem, *gem_args
      else
        Kernel.send :gem, *gem_args
      end
    end
    
    def require
      if self.options.include?(:require)
        [ self.options[:require] ].flatten.compact.each do |lib|
          Kernel.send :require, lib.to_s
        end
      else
        Kernel.send :require, self.name
      end
    end
    
  end
end