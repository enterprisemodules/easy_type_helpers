shared_examples "a boolean" do

  it { is_expected.to accept_values(true,false) }
  it { is_expected.to reject_values(1, 'a' ).with_error('Invalid value') }

end
