require 'rack/utils'

class Rack::Utils::KeySpaceConstrainedParams
  INDIFFERENT_PROC = lambda{|h,k| h[k.to_s] if k.is_a?(Symbol)}

  def initialize(limit = Rack::Utils.key_space_limit)
    @limit  = limit
    @size   = 0
    @params = Hash.new(&INDIFFERENT_PROC)
  end
end

