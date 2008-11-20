class IsoCountryCodes # :nodoc:
  VERSION = '0.1.0'

  class UnknownCodeError < StandardError; end

  class << self
    def all
      Code.all
    end

    def find(code)
      code     = code.to_s.upcase
      subclass = nil

      if code.match(/^\d{2}$/)
        code = "0#{code}" # Make numeric codes three digits
      end

      if code.match(/^\d{3}$/)
        code     = "Numeric#{code}"
        subclass = 'Numeric'
      elsif code.match(/^[A-Z]{2}$/)
        subclass = 'Alpha2'
      elsif code.match(/^[A-Z]{3}$/)
        subclass = 'Alpha3'
      end

      if !subclass.nil?
        begin
          klass = "#{self}::Code::#{subclass}::#{code}"
          return eval("#{klass}.instance")
        rescue NameError => e
          raise UnknownCodeError, "ISO 3166-1 code '#{code}' does not exist."
        end
      else
        # Not a code, so search names
        all.reject { |c| c.name.upcase != code || c.superclass.to_s != Code::Alpha3.to_s }.first.instance
      end
    end
  end
end