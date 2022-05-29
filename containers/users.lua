--[[    
    LuauProgrammer
    users.lua
    API for ROBLOX's user API
]]

--//Tables

local Users = {}

--//Modules

local HTTP = require('../utilities/HTTP')

--//Main

function Users:GetUserByID(UserId)
    assert(type(UserId) == "number", "expected number, got " .. type(UserId))
    local Response, Body = HTTP.request("GET", "https://users.roblox.com/v1/users/" .. userID)
    if Response.code ~= 200 then
        return nil
    end
    return json.decode(body)
end

module.GetUserByName = function(name)
    local params = '{ \"usernames\": [ ' .. json.encode(name) .. ' ], \"excludeBannedUsers\": true}'
    local res, body = http.request("POST", "https://users.roblox.com/v1/usernames/users/", { { "Content-Type", "text/json" } }, params)
    print(body.data)
    if res.code ~= 200 then
        return nil
    end
    local data = json.decode(body)
    if data.id ~= nil then
        return module.GetUserByID(data.id)
    end
    return nil
end

print(module.GetUserByName("BloxyColaThief"))

return Users
