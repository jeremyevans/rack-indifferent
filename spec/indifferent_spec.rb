require File.join(File.dirname(File.expand_path(__FILE__)), '../lib/rack/indifferent')
require 'rack/mock'

if defined?(RSpec)
  require 'rspec/version'
  if RSpec::Version::STRING >= '2.11.0'
    RSpec.configure do |config|
      config.expect_with :rspec do |c|
        c.syntax = :should
      end
    end
  end
end

describe 'rack-indifferent' do
  it "should make requests use indifferent param hashes" do
    params = Rack::Request.new(Rack::MockRequest.env_for('/?a=b&c[d]=e&f[][g]=h', :input=>'i=j&k[l]=m&n[][o]=p', :method=>'POST')).params
    params[:a].should == 'b'
    params[:c][:d].should == 'e'
    params[:f][0][:g].should == 'h'
    params[:i].should == 'j'
    params[:k][:l].should == 'm'
    params[:n][0][:o].should == 'p'
  end
end
