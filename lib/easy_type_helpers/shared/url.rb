shared_examples "an url" do
  url = 'http://www.enterprisemodules.com/'

  it{ is_expected.to accept_values(url, 'absent') }
  it{ is_expected.to reject_values('aaaa', 10).with_error('invalid value') }
end
