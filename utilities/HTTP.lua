--[[    
    LuauProgrammer
    users.lua
    API for ROBLOX's user API
]]

--//Tables

local HTTP = {}

--//Modules

local CoroHTTP = require('coro-http')
local JSON = require('json')

--//Variables

local Request = CoroHTTP.request
local Decode = JSON.Decode

--//Main

function HTTP:MakeRequest(Method, URL, Headers, Payload, Options)
    assert(type(Method) and type(URL) == "string", "expected string for Method and URL, got " .. type(Method) .. ", " .. type(URL))
    local Response, Body = Request(Method, URL, Headers, Payload, Options)
    if Response.code ~= 200 then
        return nil
    end
    return Response, Decode(Body)
end

return HTTP
