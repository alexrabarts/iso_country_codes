require 'test/unit'
require 'iso_country_codes'

class TestIsoCountryCodes < Test::Unit::TestCase
  def test_find_with_numeric_as_two_digit_string
    assert_equal IsoCountryCodes::Code::AUS.instance, IsoCountryCodes.find('36')
  end

  def test_find_with_numeric_as_three_digit_string
    assert_equal IsoCountryCodes::Code::AUS.instance, IsoCountryCodes.find('036')
  end

  def test_find_with_numeric_as_integer
    assert_equal IsoCountryCodes::Code::AUS.instance, IsoCountryCodes.find(36)
  end

  def test_find_with_lowercase_alpha2
    assert_equal IsoCountryCodes::Code::AUS.instance, IsoCountryCodes.find('au')
  end

  def test_find_with_uppercase_alpha2
    assert_equal IsoCountryCodes::Code::AUS.instance, IsoCountryCodes.find('AU')
  end

  def test_find_with_lowercase_alpha3
    assert_equal IsoCountryCodes::Code::AUS.instance, IsoCountryCodes.find('aus')
  end

  def test_find_with_uppercase_alpha3
    assert_equal IsoCountryCodes::Code::AUS.instance, IsoCountryCodes.find('AUS')
  end

  def test_find_with_lowercase_name
    assert_equal IsoCountryCodes::Code::AUS.instance, IsoCountryCodes.find('australia')
  end

  def test_find_with_uppercase_name
    assert_equal IsoCountryCodes::Code::AUS.instance, IsoCountryCodes.find('AUSTRALIA')
  end

  def test_find_with_mixed_case_name
    assert_equal IsoCountryCodes::Code::AUS.instance, IsoCountryCodes.find('Australia')
  end

  def test_fuzzy_find
    assert_equal IsoCountryCodes::Code::GBR.instance, IsoCountryCodes.find('united', :fuzzy => true)
    assert_raises IsoCountryCodes::UnknownCodeError do
      IsoCountryCodes.find('united')
    end
  end

  def test_get_main_currency
    assert_equal 'AUD', IsoCountryCodes.find('AUS').main_currency
  end

  def test_currency_alias_method
    code = IsoCountryCodes.find('AUS')
    assert_equal code.main_currency, code.currency
  end

  def test_get_multiple_currencies
    assert_equal IsoCountryCodes.find('ATA').currencies, %w{AUD GBP}
    assert_equal IsoCountryCodes.find('AUS').currencies, %w{AUD}
  end

  def test_get_numeric
     assert_equal '036', IsoCountryCodes::Code::AUS.numeric
     assert_equal '036', IsoCountryCodes::Code::AUS.instance.numeric
  end

  def test_get_alpha2
    assert_equal 'AU', IsoCountryCodes::Code::AUS.alpha2
    assert_equal 'AU', IsoCountryCodes::Code::AUS.instance.alpha2
  end

  def test_get_alpha3
    assert_equal 'AUS', IsoCountryCodes::Code::AUS.alpha3
    assert_equal 'AUS', IsoCountryCodes::Code::AUS.instance.alpha3
  end

  def test_get_name
    assert_equal 'Australia', IsoCountryCodes::Code::AUS.name
    assert_equal 'Australia', IsoCountryCodes::Code::AUS.instance.name
  end

  def test_get_ccode
    assert_equal '61', IsoCountryCodes::Code::AUS.c_code
    assert_equal '61', IsoCountryCodes::Code::AUS.instance.c_code
  end

  def test_for_select
    assert       IsoCountryCodes::Code.for_select.is_a?(Array)
    assert_equal IsoCountryCodes::Code.for_select.length, IsoCountryCodes::Code.all.length
  end

  def test_for_select_value_attribute
    assert_equal IsoCountryCodes::Code.for_select(:alpha3)[0][1].length, 3
  end

  def test_unknown_iso_code
    assert_raises IsoCountryCodes::UnknownCodeError do
      IsoCountryCodes.find('FOO')
    end
  end
end
