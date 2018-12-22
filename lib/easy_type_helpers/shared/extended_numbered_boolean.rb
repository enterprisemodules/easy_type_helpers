shared_examples "an extended numbered boolean (acccept 0, 1 and -1)" do
  it { is_expected.to accept_values('absent', 0,'0',1,'1',-1,'-1' ) }
  it { is_expected.to reject_values('a', 2, true, false, 'true', 'false').with_error('Invalid value') }
end
