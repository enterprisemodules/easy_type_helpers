require 'rspec/expectations'
RSpec::Matchers.define :reject_values do | *values_to_reject|
  #
  # Check if we use Beaker of Litmus
  #
  if defined?(Beaker)
    error_to_catch = Beaker::Host::CommandFailure
  else
    error_to_catch = RuntimeError
  end

  chain :with_error do |error|
    @expected_error_message = error
  end

  match do |actual|
    fail 'You must pass the .with_error(error_message) to this matcher.' unless @expected_error_message
    passed        = true
    delete_before = optional_value(:delete_before, true)
    delete_after  = optional_value(:delete_after, true)
    debug         = optional_value(:debug, false)
    values_to_reject.each do | value|
      manifest = manifest_for(resource_value, :ensure => 'absent')
      # First remove the resource
      apply_manifest(manifest, :catch_failures => true, :debug => debug) if delete_before
      begin
        manifest = manifest_for(resource_value, actual => value)
        apply_manifest(manifest, :catch_failures => true, :debug => debug)
        #
        # If we are here we didn't get the expected failure
        @message = "expected that #{resource_name} would reject value #{value}, but no rejection was reported."
        passed = false
        break
      rescue error_to_catch => error
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
    self.send(name)
  rescue NameError
    default
  end
end
