Dir.glob("#{Pathname.new(__FILE__).dirname}/shared/*.rb").each {|f| require f}
Dir.glob("#{Pathname.new(__FILE__).dirname}/acceptance/*.rb").each {|f| require f}
