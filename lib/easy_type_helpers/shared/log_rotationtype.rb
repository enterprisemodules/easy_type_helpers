shared_examples "a log_rotationtype" do
    it {is_expected.to accept_values('absent', 'bySize', 'byTime', 'none')}
    it {is_expected.to reject_values('error', '10').with_error('Invalid value')}
end

