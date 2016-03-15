shared_examples "an integer" do 

  it { is_expected.to accept_values(1, 100, 1000)}
  it {is_expected.to reject_values('aa', 1.3).with_error('Invalid integer value')}

end
