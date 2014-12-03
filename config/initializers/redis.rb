uri = URI.parse(ENV["postgres://fjmewerrlumgfa:qgriDFD-alwsxVFaigmV6cy-Ln@ec2-54-243-48-204.compute-1.amazonaws.com:5432/d19nqd35k4pti4
"] || "redis://localhost:6379/" )
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
$redis = Redis.new(:host => 'localhost', :port => 6379)