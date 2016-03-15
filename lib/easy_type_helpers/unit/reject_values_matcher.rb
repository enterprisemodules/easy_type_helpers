require 'rspec/expectations'

RSpec::Matchers.define :reject_values do | *values_to_reject|

  chain :with_error do |error|
    @expected_error_message = error
  end

  match do | actual|
    fail "You must pass the .with_error(error_message) to this matcher." unless @expected_error_message
    passed = true
    debug  = false
    extra_attributes = optional_value(:extra_attributes, {})
    values_to_reject.each do | value|
      begin
        all_attributes = extra_attributes.merge(:name => title, described_class => value)
        object_under_test.new(all_attributes)
        @message = "expected that #{described_class} would reject value #{value}, but no rejection was reported."
        passed = false
        break
      rescue => error
        #
        # we expected an error, but now also check if the message is ok
        #
        unless values_match?(Regexp.new(@expected_error_message), error.message)
          @message = "We expected the #{error.message} to contain #{@expected_error_message.to_s}, but it didn't."
          passed = false
          break
        end
      end
    end
    passed
  end

  description do
    "reject values #{Array(expected).join(', ')} with error '#{@expected_error_message.to_s}'"
  end

  failure_message do |actual|
    @message
  end

  def optional_value(name, default)
    begin
      self.send(name)
    rescue NameError
      default
    end
  end

end

