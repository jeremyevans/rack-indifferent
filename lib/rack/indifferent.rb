require 'rack'
require 'rack/utils'

if Rack.release > '2'
  module Rack::Indifferent
    class QueryParser < Rack::QueryParser
      # Work around for invalid optimization in rack
      def parse_nested_query(qs, d=nil)
        return make_params.to_params_hash if qs.nil? || qs.empty?
        super
      end
      
      class Params < Rack::QueryParser::Params
        INDIFFERENT_PROC = lambda{|h,k| h[k.to_s] if k.is_a?(Symbol)}

        def initialize(limit = Rack::Utils.key_space_limit)
          @limit  = limit
          @size   = 0
          @params = Hash.new(&INDIFFERENT_PROC)
        end
      end

      Rack::Utils.default_query_parser = new(Params, 65536, 100)
    end
  end
else
  class Rack::Utils::KeySpaceConstrainedParams
    INDIFFERENT_PROC = lambda{|h,k| h[k.to_s] if k.is_a?(Symbol)}

    def initialize(limit = Rack::Utils.key_space_limit)
      @limit  = limit
      @size   = 0
      @params = Hash.new(&INDIFFERENT_PROC)
    end
  end
end
