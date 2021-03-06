shared_examples "an integer" do
  it { is_expected.to accept_values('absent', 1, 100, 1000) }
  it { is_expected.to reject_values('aa', 1.3).with_error(integer_data_type_error) }
end
