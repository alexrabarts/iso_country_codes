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

    def c_code
      self.class.c_code
    end

    def main_currency
      self.class.main_currency
    end

    def currency
      self.class.currency
    end

    def currencies
      self.class.currencies
    end

    class << self
      attr_accessor :name, :c_code, :numeric, :alpha2, :alpha3, :main_currency
      attr_writer :currencies
      alias_method :currency, :main_currency

      @@codes = []
      def inherited(code) #:nodoc:
        super
        @@codes << code.instance if self == IsoCountryCodes::Code
      end

      def all
        @@codes.uniq
      end

      def for_select(type = :alpha2)
        all.map { |country| [country.name, country.send(type)] }
      end

      def currencies
        if defined? @currencies
          return @currencies
        else
          return [@main_currency]
        end
      end
    end
  end
end