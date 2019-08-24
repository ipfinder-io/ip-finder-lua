local inspect = require('inspect')
local ipfinder = require('ipfinder')

conf = Ipfinder:init("YOUR_TOKEN_GOES_HERE")

fire = conf:getFirewall("AS1", 'nginx_deny')

print(inspect(fire))