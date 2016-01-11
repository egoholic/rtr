module Rtr
  class Rule
    require "typed_map"
    require "rtr/rule/request_matcher"

    def initialize
      @endpoint = "/"
      @channels = []
      @children = TypedMap.new(ktype: RequestMatcher, vtype: Rule)
    end

    def [](request)

    end
  end
end
