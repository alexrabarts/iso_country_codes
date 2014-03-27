class IsoCountryCodes

  # List of legacy ISO-2 codes used in IFAD.
  # These should be changed as soon as possible in other systems.
  LEGACY_CODES = {
    'CD' => 'ZR',
    'RS' => 'YG',
    'TL' => 'TP',
  }.freeze

  def self.legacy(iso_2)
    LEGACY_CODES[iso_2.upcase]
  end

  def self.current(iso_2)
    LEGACY_CODES.invert[iso_2.upcase]
  end

  class << Code
    alias_method :orig_alpha2, :alpha2=
    private :orig_alpha2
    def alpha2=(code)
      orig_alpha2(IsoCountryCodes.legacy(code) || code)
    end
  end

end
