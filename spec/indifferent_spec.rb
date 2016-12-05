require File.join(File.dirname(File.expand_path(__FILE__)), '../lib/rack/indifferent')
require 'rack/mock'
require 'minitest/autorun'

describe 'rack-indifferent' do
  it "should make requests use indifferent param hashes" do
    params = Rack::Request.new(Rack::MockRequest.env_for('/?a=b&c[d]=e&f[][g]=h', :input=>'i=j&k[l]=m&n[][o]=p', :method=>'POST')).params
    params[:a].must_equal 'b'
    params[:c][:d].must_equal 'e'
    params[:f][0][:g].must_equal 'h'
    params[:i].must_equal 'j'
    params[:k][:l].must_equal 'm'
    params[:n][0][:o].must_equal 'p'
  end

  it "should make requests handle empty params" do
    params = Rack::Request.new(Rack::MockRequest.env_for('/', :input=>'i=j&k[l]=m&n[][o]=p', :method=>'POST')).params
    params[:a].must_be_nil
    params[:i].must_equal 'j'
    params[:k][:l].must_equal 'm'
    params[:n][0][:o].must_equal 'p'
  end
end
