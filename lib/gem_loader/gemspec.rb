module GemLoader
  
  class Gemspec
    attr_accessor :base
    
    def initialize(base)
      self.base = base
    end
    
    def integrate(spec, depend_gem_loader = true)
      spec.add_runtime_dependency("gem_loader", ">= #{GemLoader::VERSION::STRING}") if depend_gem_loader
      
      base.scope(:runtime).all_gems.each do |gem|
        spec.add_runtime_dependency(*gem.gem_args)
      end
      
      base.scope(:development).all_gems.each do |gem|
        spec.add_development_dependency(*gem.gem_args)
      end
    end
  end
  
  def self.gemspec
    Gemspec.new(self.instance)
  end
end