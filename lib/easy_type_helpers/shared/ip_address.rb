shared_examples "an ip address" do

  it {is_expected.to accept_values('absent', '10.1.100.1')}
  it {is_expected.to reject_values('0', '1', 'aa', '1:').with_error('is not valid as a FQDN or IP address')}

end


