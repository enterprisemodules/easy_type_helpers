require 'rspec/expectations'

RSpec::Matchers.define :accept_values do | *values_to_accept|
  match do | actual|
    restart = optional_value(:restart_before_active, false)
    delete  = optional_value(:delete_before, true)
    passed = true
    debug  = false
    values_to_accept.each do | value|
      if delete
        manifest = manifest_for(resource_value, :ensure => 'absent')
        # First remove the resource
        apply_manifest(manifest, :expect_failures => false, :debug => debug)
      end
      begin
        manifest = manifest_for(resource_value, actual => value)
        @message = "expected that #{resource_name} would accept value #{value} idempotent on #{actual}, but setting value failed."
        apply_manifest(manifest, :catch_failures => true, :debug => debug)
        restart_admin_server if restart
        @message = "expected that #{resource_name} would accept value #{value} idempotent on #{actual}, but is not idempotent on second pass"
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

