-- @author    Mohamed Ben rebia <mohamed@ipfinder.io>
-- @copyright Apache-2.0
-- @release   1.0.0
-- @see       https://ipfinder.io/
local Tokenvalidation = {}


-- Helper method for validating IPFINDER API TOKEN
-- @param token Your API key 
-- @see https://github.com/ipfinder-io/ip-finder-php/blob/master/src/Validation/Asnvalidation.php

function Tokenvalidation.validate(token)

	if string.len(token) <= 25 then
		error("Invalid IPFINDER API Token")
	end
	return true

end

return Tokenvalidation