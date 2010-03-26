# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gem_loader}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sunteya"]
  s.date = %q{2010-03-27}
  s.email = %q{Sunteya@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "depends.rb",
     "gem_loader.gemspec",
     "lib/gem_loader.rb",
     "lib/gem_loader/base.rb",
     "lib/gem_loader/base/dsl.rb",
     "lib/gem_loader/gem.rb",
     "lib/gem_loader/gem/dsl.rb",
     "lib/gem_loader/gemspec.rb",
     "lib/gem_loader/scope.rb",
     "lib/gem_loader/scope/dsl.rb",
     "lib/gem_loader/version.rb",
     "spec/gem_loader/base/dsl_spec.rb",
     "spec/gem_loader/base_spec.rb",
     "spec/gem_loader/gem_spec.rb",
     "spec/gem_loader/gemspec_spec.rb",
     "spec/gem_loader/scope/dsl_spec.rb",
     "spec/gem_loader/scope_spec.rb",
     "spec/gem_loader_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/sunteya/gem_loader}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{a tiny gem's dependencies loader.}
  s.test_files = [
    "spec/gem_loader/base/dsl_spec.rb",
     "spec/gem_loader/base_spec.rb",
     "spec/gem_loader/gem_spec.rb",
     "spec/gem_loader/gemspec_spec.rb",
     "spec/gem_loader/scope/dsl_spec.rb",
     "spec/gem_loader/scope_spec.rb",
     "spec/gem_loader_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
    else
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
  end
end

