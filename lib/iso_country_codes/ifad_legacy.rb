class IsoCountryCodes

  # List of legacy ISO-2 and ISO-3 codes used in IFAD.
  # These should be changed as soon as possible in other systems.
  LEGACY_CODES = {
    'CD'  => 'ZR',
    'RS'  => 'YG',
    'TL'  => 'TP',
    'COD' => 'CDR',
    'IT'  => 'IF', # IFAD is a Country for PeopleSoft
    'ITA' => 'IFA' # IFAD is a Country for PeopleSoft
  }.freeze

  def self.legacy(iso_2)
    return unless iso_2
    LEGACY_CODES[iso_2.upcase]
  end

  def self.current(iso_2)
    return unless iso_2
    LEGACY_CODES.invert[iso_2.upcase]
  end

  class << IsoCountryCodes
    alias_method :orig_find, :find
    private :orig_find

    def find(code)
      orig_find(IsoCountryCodes.current(code) || code)
    end
  end

end
