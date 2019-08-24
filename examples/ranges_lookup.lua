local inspect = require('inspect')
local ipfinder = require('ipfinder')

conf = Ipfinder:init("YOUR_TOKEN_GOES_HERE")

range = conf:getRanges("Telecom Algeria")

print(inspect(range))