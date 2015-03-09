spec = Gem::Specification.new do |s|
  s.name = 'rack-indifferent'
  s.version = '1.1.0'
  s.platform = Gem::Platform::RUBY
  s.license = "MIT"
  s.summary = "Fast indifferent access to request params"
  s.author = "Jeremy Evans"
  s.email = "code@jeremyevans.net"
  s.homepage = "http://github.com/jeremyevans/rack-indifferent"
  s.files = %w(MIT-LICENSE CHANGELOG README.rdoc Rakefile) + Dir["{spec,lib}/**/*.rb"]
  s.description = <<END
rack-indifferent monkey patches Rack::Utils::KeySpaceConstrainedParams
to make the hash it stores params in support indifferent access.  So web
frameworks that use rack-indifferent don't have to make a deep copy
of the params to allow indifferent access to the params.
END
  s.required_ruby_version = ">= 1.8.7"
  s.add_dependency "rack", '>= 1.5'
  s.add_development_dependency "rspec", '>= 1.3'
end
