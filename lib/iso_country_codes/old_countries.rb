class IsoCountryCodes
  #http://en.wikipedia.org/wiki/ISO_3166-2:AN
  class ANT < Code #:nodoc:
    self.numeric = %q{599}
    self.name    = %q{Netherlands Antilles}
    self.alpha2  = %q{AN}
    self.alpha3  = %q{ANT}
  end

  #http://en.wikipedia.org/wiki/ISO_3166-2:CS
  class SCG < Code #:nodoc:
    self.numeric = %q{381}
    self.name    = %q{Serbia and Montenegro}
    self.alpha2  = %q{CS}
    self.alpha3  = %q{SCG}
  end
end
