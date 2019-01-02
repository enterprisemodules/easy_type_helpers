describe EasyTypeHelpers do
  include EasyTypeHelpers

  it 'has a string error' do
    expect(string_data_type_error).not_to be nil
  end

  it 'has a integer error' do
    expect(integer_data_type_error).not_to be nil
  end

  it 'has a enum error' do
    expect(enum_data_type_error).not_to be nil
  end

  it 'has a boolean error' do
    expect(boolean_data_type_error).not_to be nil
  end
end
