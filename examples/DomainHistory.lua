local inspect = require('inspect')
local ipfinder = require('ipfinder')

conf = Ipfinder:init("YOUR_TOKEN_GOES_HERE")

domain = conf:getDomainHistory("google.fr")

print(inspect(domain))