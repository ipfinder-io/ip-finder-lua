-- @author    Mohamed Ben rebia <mohamed@ipfinder.io>
-- @copyright Apache-2.0
-- @release   1.0.0
-- @see       https://ipfinder.io/

local Domainvalidation = {}


-- Helper method for validating domain name
-- @param domain passing in a single website name domain name
-- @see https://github.com/ipfinder-io/ip-finder-php/blob/master/src/Validation/Domainvalidation.php

function Domainvalidation.validate(domain)

	pattern = '(?!%-)(?:[a-zA-Z%d%-]{0,62}[a-zA-Z%d]%.){1,126}(?!%d+)[a-zA-Z%d]{1,63}'
	 
	if domain:match(pattern) == nil then
	    error("Invalid Domain name")
	end
	return true

end

return Domainvalidation