module Rtr
  class Rule
    class RequestMatcher
      require "rtr/rule/request_matcher/url_part"

      AVAILABLE_HTTP_METHOD_NAMES = %i[get post patch put delete info head trace options link unlink]

      def initialize(http_method, url_parts)
        raise ArgumentError, "'http_method' should be an instance of Symbol" unless http_method.instance_of? Symbol
        raise ArgumentError, "'http_method' has wrong HTTP method/verb"      unless available_http_method_names.include?(http_method)
        raise ArgumentError, "'url_parts' should be an instance of Array"    unless url_parts.instance_of? Array
        raise ArgumentError, "'url_parts' should contain url parts"          unless url_parts.any? { |p| p.instance_of? UrlPart }
        @http_method = http_method
        @url_parts   = url_parts
      end


      def match?(request)

      end

      private

      def available_http_method_names
        AVAILABLE_HTTP_METHOD_NAMES
      end
    end
  end
end
