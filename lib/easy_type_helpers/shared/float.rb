shared_examples "a float" do 

  it { is_expected.to accept_values(1.1, 100.4, 1000.6)}
  it {is_expected.to reject_values('aa', true, '4#4').with_error('Invalid value')}

end
