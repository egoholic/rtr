module Rtr
  class Rule
    class RequestMatcher
      class UrlPart
        PART_TYPE_MATCH_METHOD_MAP = {
          String => :"==",
          Regexp => :"=~",
          Fixnum => :"==",
          Bignum => :"=="
        }

        def initialize(part, required:)
          raise ArgumentError, "'part' should be an instance of String, Regexp, Fixnum or Bignum" unless available_part_types.any? { |t| part.instance_of? t }
          raise ArgumentError, "'required' should be an instance of TrueClass or FalseClass"      unless required.instance_of?(TrueClass) || required.instance_of?(FalseClass)

          @part     = part
          @required = required
        end

        def matches?(val)
          @part.send match_method, val
        end

        private

        def available_part_types
          PART_TYPE_MATCH_METHOD_MAP.keys
        end

        def match_method
          @match_method ||= PART_TYPE_MATCH_METHOD_MAP[@part.class]
        end
      end
    end
  end
end
