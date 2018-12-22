require 'rspec/expectations'

RSpec::Matchers.define :accept_values do |*values_to_accept|
  match do |actual|
    passed = true
    debug  = false
    extra_attributes = optional_value(:extra_attributes, {})
    values_to_accept.each do | value|
      begin
        @message = "expected that #{described_class} would accept value #{value}, but it fails."
        all_attributes = extra_attributes.merge(:name => title, described_class => value)
        object_under_test.new(all_attributes)
      rescue => error
        passed = false
        puts error
        @message
        break
      end
    end
    passed
  end

  description do
    "accept values #{Array(expected).join(', ')}"
  end

  failure_message do |actual|
    @message
  end

  def optional_value(name, default)
    self.send(name)
  rescue NameError
    default
  end
end
