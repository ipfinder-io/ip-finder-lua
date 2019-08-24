local inspect = require('inspect')
local ipfinder = require('ipfinder')

conf = Ipfinder:init("YOUR_TOKEN_GOES_HERE")

status = conf:getStatus()

print(inspect(status))