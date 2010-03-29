require File.expand_path("../gem/dsl", __FILE__)

module GemLoader
  class GemRequirement
    
    attr_accessor :name, :version_requirements
    
    def initialize(name)
      self.name = name
      self.version_requirements = []
    end
    
    def add_version_requirement(version_requirement)
      self.version_requirements << version_requirement if version_requirement
    end
    
  end
end