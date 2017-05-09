require 'rspec/expectations'

RSpec::Matchers.define :iib_accept_values do |*values_to_accept|
  match do |actual|
    ensure_present  = optional_value(:ensure_present, true)
    debug           = optional_value(:debug, false)
    passed          = true
    values_to_accept.each do |value|
      manifest = manifest_for(resource_value)
      apply_manifest(manifest, :expect_failures => false, :debug => debug) if ensure_present
      begin
        #
        # Test the on_create methods
        #
        manifest = manifest_for(resource_value, actual => value)
        @message = "expected that #{resource_name} would accept " \
                   "value #{value} idempotent on #{actual} on_" \
                   'create, but setting value failed.'
        apply_manifest(manifest, :catch_failures => true, :debug => debug)
      rescue Beaker::Host::CommandFailure => error
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
    begin
      self.send(name)
    rescue NameError
      default
    end
  end
end
