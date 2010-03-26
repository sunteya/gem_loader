require File.expand_path("../depends.rb", __FILE__)
GemLoader.require :test, :rakefile

Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs = [ 'lib', 'spec' ]
  spec.spec_opts = ['--options', "spec/spec.opts"]
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

namespace :spec do
  Spec::Rake::SpecTask.new(:rcov) do |spec|
    spec.libs = [ 'lib', 'spec' ]
    spec.pattern = 'spec/**/*_spec.rb'
    spec.rcov = true
  end
end


Jeweler::Tasks.new do |gem|
  gem.name = "gem_loader"
  gem.summary = "a tiny gem's dependencies loader."
  gem.email = "Sunteya@gmail.com"
  gem.homepage = "http://github.com/sunteya/gem_loader"
  gem.authors = ["Sunteya"]
end
Jeweler::GemcutterTasks.new

task :spec => :check_dependencies
task :default => :spec