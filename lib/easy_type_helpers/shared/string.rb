shared_examples "a string" do

  lower_case_string   = 'lowercasestring'
  upper_case_string   = 'UPPERCASESTRING'
  mixed_case_string   = 'MixedCaseString'
  string_with_numbers = 'StringWith1234Numbers'

  valid_values = [
    'lowercasestring',
    'UPPERCASESTRING',
    'MixedCaseString',
    'StringWith1234Numbers',
    'string_with_underscores',
    'string-with-dashes'
  ]

  it {is_expected.to accept_values(*valid_values)}
  # TODO: Now most string implementaion can use anything
  # it {is_expected.to reject_values(['1', '1', 'aa', '1:']).with_error('is not valid as a FQDN or IP address')}
end
