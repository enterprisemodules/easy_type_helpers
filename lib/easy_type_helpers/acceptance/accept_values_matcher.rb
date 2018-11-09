require 'rspec/expectations'

RSpec::Matchers.define :accept_values do | *values_to_accept|
  match do | actual|
    delete_before = optional_value(:delete_before, true)
    delete_after  = optional_value(:delete_after, true)
    debug         = optional_value(:debug, false)
    passed        = true
    values_to_accept.each do | value|
      manifest = manifest_for(resource_value, :ensure => 'absent')
      # First remove the resource
      apply_manifest(manifest, :catch_failures => true, :debug => debug) if delete_before
      begin
        #
        # Test the on_create methods
        #
        manifest = manifest_for(resource_value, actual => value)
        @message = "expected that #{resource_name} would accept value #{value} idempotent on #{actual} on create , but setting value failed."
        apply_manifest(manifest, :catch_failures => true, :debug => debug)
        @message = "expected that #{resource_name} would accept value #{value} idempotent on #{actual}, but is not idempotent on second pass after create"
        apply_manifest(manifest, :catch_changes => true, :debug => debug)
        if delete_after
          #
          # Delete it again and restart
          #
          manifest = manifest_for(resource_value, :ensure => 'absent')
          apply_manifest(manifest, :catch_failures => true, :debug => debug)
        end
        #
        # Now create an "empty" resource
        #
        manifest = manifest_for(resource_value, :ensure => 'present')
        apply_manifest(manifest, :catch_failures => true, :debug => debug)
        #
        # Now do the changes
        #
        manifest = manifest_for(resource_value, actual => value)
        @message = "expected that #{resource_name} would accept value #{value} idempotent on #{actual} on modify, but setting value failed."
        apply_manifest(manifest, :catch_failures => true, :debug => debug)
        @message = "expected that #{resource_name} would accept value #{value} idempotent on #{actual}, but is not idempotent on second pass after modify"
        apply_manifest(manifest, :catch_changes => true, :debug => debug)
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
