local inspect = require('inspect')
local ipfinder = require('ipfinder')

conf = Ipfinder:init()

auth = conf:Authentication()

print(inspect(auth))