require "spec_helper"

describe GemLoader::Gemspec do
  
  it "should integrate gemspec with gem_loader" do
    spec = Gem::Specification.new
    GemLoader.gemspec.integrate(spec)
    spec.runtime_dependencies.first.name.should == "gem_loader"
  end
  
  it "should integrate to gemspec" do
    @context.setup do
      scope :runtime do
        gem "run", "= 0.2"
      end
      
      scope :development do
        gem "dev"
      end
    end
    
    spec = Gem::Specification.new
    GemLoader.gemspec.integrate(spec, false)
    spec.runtime_dependencies.each do |gem|
      gem.name.should == "run"
      gem.requirement.requirements.last.should == Gem::Requirement.parse("= 0.2")
    end

    spec.development_dependencies.map(&:name).should == ["dev"]
  end
  
end