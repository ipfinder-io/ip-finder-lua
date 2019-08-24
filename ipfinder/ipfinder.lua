-- @author    Mohamed Ben rebia <mohamed@ipfinder.io>
-- @copyright Apache-2.0
-- @release   1.0.0
-- @see       https://ipfinder.io/

local requests = require('requests')
-- local Asnvalidation = require("Validation/Asnvalidation")
-- local Domainvalidation = require("Validation/Domainvalidation")
-- local Firewallvalidation = require("Validation/Firewallvalidation")
-- local Ipvalidation = require("Validation/Ipvalidation")
-- local Tokenvalidation = require("Validation/Tokenvalidation")

Ipfinder = {}
Ipfinder.__index = Ipfinder


-- DEFAULT BASE URL

local DEFAULT_BASE_URL = "https://api.ipfinder.io/v1/"


-- The free token

local DEFAULT_API_TOKEN = "free"


-- DEFAULT FORMAT

local FORMAT = "json"


-- service status path

local STATUS_PATH = "info"


-- IP Address Ranges path

local RANGES_PATH = "ranges/"


--  Firewall path

local FIREWALL_PATH = "firewall/"


-- Get Domain IP path

local DOMAIN_PATH = "domain/"


-- Get Domain IP history path

local DOMAIN_H_PATH = "domainhistory/"


-- Domain By ASN, Country,Ranges path

local DOMAIN_BY_PATH = "domainby/"

--
-- Constructor
-- @param token   add your token
-- @param baseUrl add proxy pass

function Ipfinder:init(token, baseUrl)
  local ipfinder = {}             -- our new object
  setmetatable(ipfinder,Ipfinder)  -- make Ipfinder handle lookup

  if token == nil then

    ipfinder.token = DEFAULT_API_TOKEN
    --print('is null')
  else
  --  Tokenvalidation.validate(token)
    ipfinder.token = token
  end

  if baseUrl == nil then
    ipfinder.baseUrl = DEFAULT_BASE_URL
    --print('is null')
  else

    ipfinder.baseUrl = baseUrl
  end


  return ipfinder
end


-- call to server
-- @param path    specific path of asn, IP address, ranges, Firewall,Token status
-- @param formats available format `json` `jsonp` `php` `xml` and firewall format
-- @return data
-- @usage self:call(path,formats)


function Ipfinder:call(path, formats)
  local ipfinder = {}   

  if formats == nil then
    format = FORMAT
  else
    format = formats
  end

  if path == nil then
    path = ""
  else
    path = path
  end

  local endpoint = self.baseUrl .. path
  local header = {
    ["Content-Type"] = "application/json",
    ["User-Agent"] = "IPfinder Lua/client"
  }

  response = requests.post{endpoint, data={token=self.token,format=format},headers = headers}
  json_data = response.json()


  return json_data;

end

--  URL and string  encoding
--@see https://rosettacode.org/wiki/URL_encoding#Lua

local function encodeString(str)
  local output, t = string.gsub(str,"[^%w]",encodeChar)
  return output
end

-- Get details for an Your IP address.
-- @return your ip data
-- @usage API:Authentication()

function Ipfinder:Authentication()
  return self:call()
end

-- Get details for an IP address.
-- @param path IP address.
-- @return ip data
-- @usage API:getAddressInfo("1.0.0.0")

function Ipfinder:getAddressInfo(path)
 -- Ipvalidation.validate(path)
  return self:call(path)
end

-- Get details for an AS number.
-- @param path AS number.
-- @return ASN data
-- @usage API:getAsn("AS1")

function Ipfinder:getAsn(path)
  Asnvalidation.validate(path)
  return self:call(path)
end

-- Get details for an API Token .
-- @return Token data
-- @usage API:getAddressInfo()

function Ipfinder:getStatus()
  return self:call(STATUS_PATH)
end

-- Get details for an Organization name.
-- @param path Organization name.
-- @return Organization data
-- @usage API:getRanges("Telecom Algeria")

function Ipfinder:getRanges(path)
  return self:call(RANGES_PATH .. encodeString(path))
end

-- Get Firewall data
-- @param path    AS number, alpha-2 country only.
-- @param formats list formats supported
-- @return Firewall data
-- @usage API:getFirewall("DZ",'nginx_deny')

function Ipfinder:getFirewall(path, formats)
 -- Firewallvalidation.validate(path,formats)
  return self:call(FIREWALL_PATH .. path,formats)
end

-- Get Domain IP
-- @param path  The API supports passing in a single website name domain name
-- @return Domain IP data
-- @usage API:getDomain("google.com")

function Ipfinder:getDomain(path)
 -- Domainvalidation.validate(path)
  return self:call(DOMAIN_PATH .. path)
end

-- Get Domain History IP
-- @param path The API supports passing in a single website name domain name
-- @return Domain History data
-- @usage API:getDomainHistory("google.com")

function Ipfinder:getDomainHistory(path)
 -- Domainvalidation.validate(path)
  return self:call(DOMAIN_H_PATH .. path)
end

-- Get list Domain By ASN, Country,Ranges
-- @param by The API supports passing in a single ASN,Country,Ranges
-- @return Domain By data
-- @usage API:getDomainBy("DZ")

function Ipfinder:getDomainBy(by)
  return self:call(DOMAIN_BY_PATH .. by)
end

-- create and use an Ipfinder

return ipfinder