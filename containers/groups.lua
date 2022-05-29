
--[[    
    LuauProgrammer
    groups.lua
    API for ROBLOX's group API
]]

local module = {}
local token = require('./authentication').AuthenticationToken
local http = require('coro-http')
local json = require('json')

module.AcceptJoinRequest = function(userID,groupID)
    local res, body = http.request("POST", "https://groups.roblox.com/v1/groups/"..groupID.."/join-requests/users/"..userID, {{"Content-Type", "text/json"},{"Content-Length", "0"}, {"X-CSRF-TOKEN", X_CSRF_TOKEN}, {"Cookie", token}})
    if res.code ~= 200 then
        return false
    end
    return true
end

module.DeclineJoinRequest = function(userID,groupID)
    local res, body = http.request("DELETE", "https://groups.roblox.com/v1/groups/"..groupID.."/join-requests/users/"..userID, {{"Content-Type", "text/json"},{"Content-Length", "0"}, {"X-CSRF-TOKEN", X_CSRF_TOKEN}, {"Cookie", token}})
    if res.code ~= 200 then
        return false
    end
    return true
end

module.GetGroupInformation = function(groupID)
    local res, body = http.request("GET", "https://groups.roblox.com/v1/groups/"..groupID)
    if res.code ~= 200 then
        return nil, res.reason
    end
    return json.decode(body)
end
--[[
module.UpdateUserRole = function(userID,groupID,roleID,X_CSRF_TOKEN)
    local params = json.encode('{\"roleId\":'..roleID..'}')
    local res, body = http.request("PATCH", "https://groups.roblox.com/v1/groups/"..groupID.."/users/"..userID,{{"Content-Type", "text/json"},{"Content-Length", "0"}, {"X-CSRF-TOKEN", X_CSRF_TOKEN}, {"Cookie", ".ROBLOSECURITY=eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI3ZTFhOWQzYy1mM2IwLTQ4NmYtODk2Yi1kZmE3ZTU1ZmZmY2MiLCJzdWIiOjMyMzMzNTc1fQ.al0D3aHcOvJ-szsVDhDXqVeqNp89xwna9ozkET9LKwU"}}, params,{".ROBLOSECURITY=eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI3ZTFhOWQzYy1mM2IwLTQ4NmYtODk2Yi1kZmE3ZTU1ZmZmY2MiLCJzdWIiOjMyMzMzNTc1fQ.al0D3aHcOvJ-szsVDhDXqVeqNp89xwna9ozkET9LKwU"})
    if res.code ~= 200 then
        print(res.reason)
        if res.code ~= 401 then
            return false
        end
        module.UpdateUserRole(userID,groupID,roleID,res[6][2])
    end
    return true
end
]]

module.ExileUser = function(userID,groupID)
    local res, body = http.request("DELETE", "https://groups.roblox.com/v1/groups/"..groupID.."/users/"..userID, {{"Content-Type", "text/json"},{"Content-Length", "0"}, {"X-CSRF-TOKEN", X_CSRF_TOKEN}, {"Cookie", token}})
    if res.code ~= 200 then
        return false
    end
    return true
end

return module