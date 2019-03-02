require 'easy_type_helpers/data_type_errors'
Dir.glob("#{Pathname.new(__FILE__).dirname}/shared/*.rb").each { |f| require f }
Dir.glob("#{Pathname.new(__FILE__).dirname}/unit/*.rb").each { |f| require f }
