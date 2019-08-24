-- @author    Mohamed Ben rebia <mohamed@ipfinder.io>
-- @copyright Apache-2.0
-- @release   1.0.0
-- @see       https://ipfinder.io/
local Asnvalidation = {}


-- Helper method for validating an argument if it is asn number
-- @param The AS number you want details for
-- @see https://github.com/ipfinder-io/ip-finder-php/blob/master/src/Validation/Asnvalidation.php

function Asnvalidation.validate(asn)

	pattern = '(AS)(%d+)'
	 
	if asn:match(pattern) == nil then
	    error("Invalid asn number")
	end
	return true

end

return Asnvalidation