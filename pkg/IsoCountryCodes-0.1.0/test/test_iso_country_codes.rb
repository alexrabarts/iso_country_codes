require 'test/unit'
require 'iso_country_codes'

class TestIsoCountryCodes < Test::Unit::TestCase
  def test_find_with_numeric_as_two_digit_string
    code = IsoCountryCodes.find('36')
    assert_equal IsoCountryCodes::Code::Numeric::Numeric036.instance, code
  end

  def test_find_with_numeric_as_three_digit_string
    code = IsoCountryCodes.find('036')
    assert_equal IsoCountryCodes::Code::Numeric::Numeric036.instance, code
  end

  def test_find_with_numeric_as_integer
    code = IsoCountryCodes.find(36)
    assert_equal IsoCountryCodes::Code::Numeric::Numeric036.instance, code
  end

  def test_find_with_lowercase_alpha2
    code = IsoCountryCodes.find('au')
    assert_equal IsoCountryCodes::Code::Alpha2::AU.instance, code
  end

  def test_find_with_uppercase_alpha2
    code = IsoCountryCodes.find('AU')
    assert_equal IsoCountryCodes::Code::Alpha2::AU.instance, code
  end

  def test_find_with_lowercase_alpha3
    code = IsoCountryCodes.find('aus')
    assert_equal IsoCountryCodes::Code::Alpha3::AUS.instance, code
  end

  def test_find_with_uppercase_alpha3
    code = IsoCountryCodes.find('AUS')
    assert_equal IsoCountryCodes::Code::Alpha3::AUS.instance, code
  end

  def test_find_with_lowercase_name
    code = IsoCountryCodes.find('australia')
    assert_equal IsoCountryCodes::Code::Alpha3::AUS.instance, code
  end

  def test_find_with_uppercase_name
    code = IsoCountryCodes.find('AUSTRALIA')
    assert_equal IsoCountryCodes::Code::Alpha3::AUS.instance, code
  end

  def test_find_with_mixed_case_name
    code = IsoCountryCodes.find('Australia')
    assert_equal IsoCountryCodes::Code::Alpha3::AUS.instance, code
  end

  def test_numeric_get_numeric
     assert_equal '036', IsoCountryCodes::Code::Numeric::Numeric036.numeric
     assert_equal '036', IsoCountryCodes::Code::Numeric::Numeric036.instance.numeric
  end

  def test_numeric_get_alpha2
    assert_equal 'AU', IsoCountryCodes::Code::Numeric::Numeric036.alpha2
    assert_equal 'AU', IsoCountryCodes::Code::Numeric::Numeric036.instance.alpha2
  end

  def test_numeric_get_alpha3
    assert_equal 'AUS', IsoCountryCodes::Code::Numeric::Numeric036.alpha3
    assert_equal 'AUS', IsoCountryCodes::Code::Numeric::Numeric036.instance.alpha3
  end
  
  def test_numeric_get_name
    assert_equal 'Australia', IsoCountryCodes::Code::Numeric::Numeric036.name
    assert_equal 'Australia', IsoCountryCodes::Code::Numeric::Numeric036.instance.name
  end

  def test_alpha2_get_numeric
    assert_equal '036', IsoCountryCodes::Code::Alpha2::AU.numeric
    assert_equal '036', IsoCountryCodes::Code::Alpha2::AU.instance.numeric
  end

  def test_alpha2_get_alpha2
    assert_equal 'AU', IsoCountryCodes::Code::Alpha2::AU.alpha2
    assert_equal 'AU', IsoCountryCodes::Code::Alpha2::AU.instance.alpha2
  end

  def test_alpha2_get_alpha3
    assert_equal 'AUS', IsoCountryCodes::Code::Alpha2::AU.alpha3
    assert_equal 'AUS', IsoCountryCodes::Code::Alpha2::AU.instance.alpha3
  end

  def test_alpha2_get_name
    assert_equal 'Australia', IsoCountryCodes::Code::Alpha2::AU.name
    assert_equal 'Australia', IsoCountryCodes::Code::Alpha2::AU.instance.name
  end

  def test_alpha3_get_numeric
    assert_equal '036', IsoCountryCodes::Code::Alpha3::AUS.numeric
    assert_equal '036', IsoCountryCodes::Code::Alpha3::AUS.instance.numeric
  end

  def test_alpha3_get_alpha2
    assert_equal 'AU', IsoCountryCodes::Code::Alpha3::AUS.alpha2
    assert_equal 'AU', IsoCountryCodes::Code::Alpha3::AUS.instance.alpha2
  end

  def test_alpha3_get_alpha3
    assert_equal 'AUS', IsoCountryCodes::Code::Alpha3::AUS.alpha3
    assert_equal 'AUS', IsoCountryCodes::Code::Alpha3::AUS.instance.alpha3
  end

  def test_alpha3_get_name
    assert_equal 'Australia', IsoCountryCodes::Code::Alpha3::AUS.name
    assert_equal 'Australia', IsoCountryCodes::Code::Alpha3::AUS.instance.name
  end

  def test_unknown_iso_code
    assert_raises IsoCountryCodes::UnknownCodeError do
      IsoCountryCodes.find('FOO')
    end
  end

  def test_equality
    numeric_code = IsoCountryCodes::Code::Numeric::Numeric036.instance
    alpha2_code  = IsoCountryCodes::Code::Alpha2::AU.instance
    alpha3_code  = IsoCountryCodes::Code::Alpha3::AUS.instance

    assert_equal numeric_code, alpha2_code
    assert_equal alpha2_code, alpha3_code
    assert_equal alpha3_code, numeric_code
  end
end
