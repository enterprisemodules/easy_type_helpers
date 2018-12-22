shared_examples "a string" do
  lower_case_string   = 'lowercasestring'
  upper_case_string   = 'UPPERCASESTRING'
  mixed_case_string   = 'MixedCaseString'
  string_with_numbers = 'StringWith1234Numbers'

  valid_values = [
    'absent',
    'lowercasestring',
    'UPPERCASESTRING',
    'MixedCaseString',
    'StringWith1234Numbers',
    'string_with_underscores',
    'string-with-dashes'
  ]

  it { is_expected.to accept_values(*valid_values) }
end
