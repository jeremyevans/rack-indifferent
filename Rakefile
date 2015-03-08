require "rake"
require "rake/clean"

CLEAN.include ["rack-indifferent-*.gem"]

desc "Build rack-indifferent gem"
task :package=>[:clean] do |p|
  sh %{#{FileUtils::RUBY} -S gem build rack-indifferent.gemspec}
end

### Specs

begin
  begin
    # RSpec 1
    require "spec/rake/spectask"
    spec_class = Spec::Rake::SpecTask
    spec_files_meth = :spec_files=
  rescue LoadError
    # RSpec 2
    require "rspec/core/rake_task"
    spec_class = RSpec::Core::RakeTask
    spec_files_meth = :pattern=
  end

  spec = lambda do |name, files, d|
    lib_dir = File.join(File.dirname(File.expand_path(__FILE__)), 'lib')
    ENV['RUBYLIB'] ? (ENV['RUBYLIB'] += ":#{lib_dir}") : (ENV['RUBYLIB'] = lib_dir)
    desc d
    spec_class.new(name) do |t|
      t.send(spec_files_meth, files)
    end
  end

  task :default => [:spec]
  spec.call("spec", Dir["spec/*_spec.rb"], "Run specs")
rescue LoadError
  task :default do
    puts "Must install rspec to run the default task (which runs specs)"
  end
end
