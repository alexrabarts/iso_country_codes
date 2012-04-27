class IsoCountryCodes # :nodoc:
  class UnknownCodeError < StandardError; end

  class << self

    def for_select(*args)
      Code.for_select(*args)
    end

    def all
      Code.all
    end

    def find(code, opts={})
      code = code.to_s.upcase
      instance = nil

      if code.match(/^\d{2}$/)
        code = "0#{code}" # Make numeric codes three digits
      end

<<<<<<< HEAD
       if code.match(/^\d{3}$/)
=======
      if code.match(/^\d{3}$/)
>>>>>>> mods
        instance = all.select { |c| c.numeric == code }.first
      elsif code.match(/^[A-Z]{2}$/)
        instance = all.select { |c| c.alpha2 == code }.first
      elsif code.match(/^[A-Z]{3}$/)
        instance = all.select { |c| c.alpha3 == code }.first
      else
        instance = all.select { |c| c.name.upcase == code }.first
        if opts[:fuzzy]
          instance = all.select { |c| c.name.match(/^#{code}/i) }.first if instance.nil?
          instance = all.select { |c| c.name.match(/#{code}/i) }.first if instance.nil?
        end
        
      end
      raise UnknownCodeError, "Country code does not exist '#{code}' " if instance.nil?

      instance
    end

    def find_country(code, opts={})
      code = code.to_s.upcase
      instance = nil
      begin
        if code.match(/^\d{3}$/)
          instance = all.select { |c| c.c_code == code }.first
        elsif code.match(/^\d{2}$/)
          instance = all.select { |c| c.c_code == code }.first
        elsif code.match(/^\d{1}$/)
          instance = all.select { |c| c.c_code == code }.first
        end

        raise UnknownCodeError, "Calling Code '#{code}' does not exist." if instance.nil?

        rescue UnknownCodeError => e
          instance = e
      end

      instance
    end

  end
end