local inspect = require('inspect')
local ipfinder = require('ipfinder')

conf = Ipfinder:init("YOUR_TOKEN_GOES_HERE")

ip = conf:getAddressInfo("1.0.0.0")

print(inspect(ip))

print(ip.ip)