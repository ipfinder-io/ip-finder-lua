local inspect = require('inspect')
local ipfinder = require('ipfinder')

conf = Ipfinder:init("YOUR_TOKEN_GOES_HERE")

asn = conf:getAsn("AS1")

print(inspect(asn))