shared_examples "a numbered boolean (accept 0 and 1)" do

  it {is_expected.to accept_values(0,'0',1,'1')}
  it {is_expected.to reject_values(-1, '-1', 'a', 2, true, false, 'true', 'false').with_error('Invalid value')}

end
