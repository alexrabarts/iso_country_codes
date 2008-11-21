class IsoCountryCodes # :nodoc:
  VERSION = '0.1.0'

  class UnknownCodeError < StandardError; end

  class << self
    def all
      Code.all
    end

    def find(code)
      code     = code.to_s.upcase
      instance = nil

      if code.match(/^\d{2}$/)
        code = "0#{code}" # Make numeric codes three digits
      end

      if code.match(/^\d{3}$/)
        instance = all.select { |c| c.numeric == code }.first
      elsif code.match(/^[A-Z]{2}$/)
        instance = all.select { |c| c.alpha2 == code }.first
      elsif code.match(/^[A-Z]{3}$/)
        instance = all.select { |c| c.alpha3 == code }.first
      else
        instance = all.select { |c| c.name.upcase == code }.first
      end

      raise UnknownCodeError, "ISO 3166-1 code '#{code}' does not exist." if instance.nil?

      instance
    end
  end
end