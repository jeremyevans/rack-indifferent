require "rake"
require "rake/clean"

CLEAN.include ["rack-indifferent-*.gem"]

desc "Build rack-indifferent gem"
task :package=>[:clean] do |p|
  sh %{#{FileUtils::RUBY} -S gem build rack-indifferent.gemspec}
end

desc "Build rack-indifferent gem"
task :spec do |p|
  sh %{#{FileUtils::RUBY} -I lib spec/indifferent_spec.rb}
end
task :default => :spec
