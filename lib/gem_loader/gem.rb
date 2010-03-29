require File.expand_path("../gem/dsl", __FILE__)

module GemLoader
  class Gem
    attr_accessor :name, :gem_requirement, :version_requirement, :options
    
    def initialize(name, gem_requirement, *args)
      self.name = name.to_s
      self.gem_requirement = gem_requirement
      self.options = {}

      self.parse_args(*args)
    end
    
    def parse_args(*args)
      self.options = args.pop if args.last.is_a?(Hash)
      self.version_requirement = args.first
      self.gem_requirement.add_version_requirement(version_requirement)
      self
    end
    
    def version_requirements
      self.gem_requirement.version_requirements
    end
    
    def gem_args
      [self.name, self.version_requirements ].compact.flatten
    end
    
    def load
      Kernel.send :gem, *gem_args
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