module EasyTypeHelpers
  # Wrong type generic error from ResourceApi regexp
  def string_data_type_error
    Regexp.new(
      '( expects a String value' \
      '|Invalid value)' # match top or bottom
    )
  end

  def integer_data_type_error
    Regexp.new(
      '( expects an Integer value' \
      '|Invalid value for Integer' \
      '|expects a match for Variant\[.*, Integer\]' \
      '|expects a match for Variant\[.*, Integer\[.*\]\])'
    )
  end

  def float_data_type_error
    Regexp.new(
      '( expects an Float value' \
      "|can't convert .* into Float" \
      '|invalid value for Float)' # match top or bottom
    )
  end

  def enum_data_type_error
    Regexp.new(
      '( expects a match for Enum' \
      '|Invalid value)' # match top or bottom
    )
  end

  def boolean_data_type_error
    Regexp.new(
      '( expects a Boolean value' \
      '|is not a valid boolean' \
      '|Valid values are true\, false)' # match top or bottom
    )
  end

  def variant_data_type_error
    Regexp.new(
      '( expects a match for Variant' \
      '|Invalid value)' # match top or bottom
    )
  end
end

RSpec.configure do |c|
  c.include EasyTypeHelpers
end
