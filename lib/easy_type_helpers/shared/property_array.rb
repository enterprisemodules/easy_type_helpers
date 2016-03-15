shared_examples "a property array" do

  it{ is_expected.to accept_values(['a=1','b=2'])}
  it{ is_expected.to reject_values(['a','b']).with_error(' Syntax attribute-value expected')}
  it{ is_expected.to reject_values('a,b').with_error('You need to specify an Array')}

end
