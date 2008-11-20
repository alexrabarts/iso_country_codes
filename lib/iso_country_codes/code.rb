require 'singleton'

class IsoCountryCodes
  class Code
    include Singleton

    def eql?(other_code)
      numeric == other_code.numeric
    end

    def ==(other_code)
      eql?(other_code)
    end

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
        @@codes << code if %w{
          IsoCountryCodes::Code::Numeric
          IsoCountryCodes::Code::Alpha2
          IsoCountryCodes::Code::Alpha3
        }.include? self.to_s
      end

      def all
        @@codes.uniq
      end
    end
  end
end