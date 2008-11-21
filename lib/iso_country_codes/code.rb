require 'singleton'

class IsoCountryCodes
  class Code
    include Singleton

    def name
      self.class.name
    end

    def numeric
      self.class.numeric
    end

    def alpha2
      self.class.alpha2
    end

    def alpha3
      self.class.alpha3
    end

    class << self
      attr_accessor :name, :numeric, :alpha2, :alpha3

      @@codes = []
      def inherited(code) #:nodoc:
        super
        @@codes << code.instance if self == IsoCountryCodes::Code
      end

      def all
        @@codes.uniq
      end
    end
  end
end