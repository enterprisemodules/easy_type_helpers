shared_examples "a port number" do

  it {is_expected.to accept_values('absent', 7001)}
  it {is_expected.to reject_values('a', '-1','1:').with_error('is not valid as a port number')}

end


