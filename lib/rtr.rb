require "rtr/version"

module Rtr
  require "rtr/rule"
  require "rtr/router"

  class << self
    def router
      raise ArgumentError, "no block given" unless block_given?

      rule = Rule.new
      yield rule

      Router.new rule
    end
  end
end
