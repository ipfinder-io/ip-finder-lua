-- @author    Mohamed Ben rebia <mohamed@ipfinder.io>
-- @copyright Apache-2.0
-- @release   1.0.0
-- @see       https://ipfinder.io/
local Ipvalidation = {}


-- Helper method for validating an IP address
-- @param ip single IPv4 or IPv6 IP address
-- @see https://github.com/ipfinder-io/ip-finder-php/blob/master/src/Validation/Ipvalidation.php

function Ipvalidation.validate(ip)
	pattern = '(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])%.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$|^(([a-zA-Z]|[a-zA-Z][a-zA-Z0-9%-]*[a-zA-Z0-9])%.)*([A-Za-z]|[A-Za-z][A-Za-z0-9%-]*[A-Za-z0-9])$|^%s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]%d|1%d%d|[1-9]?%d)(%.(25[0-5]|2[0-4]%d|1%d%d|[1-9]?%d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]%d|1%d%d|[1-9]?%d)(%.(25[0-5]|2[0-4]%d|1%d%d|[1-9]?%d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]%d|1%d%d|[1-9]?%d)(%.(25[0-5]|2[0-4]%d|1%d%d|[1-9]?%d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]%d|1%d%d|[1-9]?%d)(%.(25[0-5]|2[0-4]%d|1%d%d|[1-9]?%d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]%d|1%d%d|[1-9]?%d)(%.(25[0-5]|2[0-4]%d|1%d%d|[1-9]?%d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]%d|1%d%d|[1-9]?%d)(%.(25[0-5]|2[0-4]%d|1%d%d|[1-9]?%d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]%d|1%d%d|[1-9]?%d)(%.(25[0-5]|2[0-4]%d|1%d%d|[1-9]?%d)){3}))|:)))(%.+)?%s*'
	 
	if ip:match(pattern) == nil then
	    error("Invalid IPaddress")
	end
	return true
end

return Ipvalidation