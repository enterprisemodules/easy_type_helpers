shared_examples "a file name" do
  file_name = '/opt/oracle_a_file'

  it { is_expected.to accept_values(file_name) }
  # it { is_expected.to reject_values(['aaaa', 10]).with_error('invalid file name') }
end
