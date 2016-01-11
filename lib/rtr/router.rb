module Rtr
  class Router
    def initialize(rule)
      raise ArgumentError, "'rule' should be an instance of Rule" unless rule.instance_of? Rule

      @rule = rule
    end

    def route(request)
      channels = @rule[request]
    end
  end
end
