shared_examples "a boolean" do

  it { is_expected.to accept_values(true,false) }
  it { is_expected.to reject_values(5, 'a' ).with_error(boolean_data_type_error) }

end
