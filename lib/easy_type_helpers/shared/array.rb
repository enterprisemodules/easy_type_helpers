shared_examples "an array" do
  it { is_expected.to accept_values(['a', 'b']) }
  it { is_expected.to reject_values('a,b').with_error('You need to specify an Array') }
end
