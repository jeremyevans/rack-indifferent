require 'rack/utils'

class Rack::Utils::KeySpaceConstrainedParams
  def initialize(limit = Rack::Utils.key_space_limit)
    @limit  = limit
    @size   = 0
    @params = Hash.new{|h,k| h[k.to_s] if k.is_a?(Symbol)}
  end
end

