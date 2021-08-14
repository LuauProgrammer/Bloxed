
--[[   
    LuauProgrammer
    init.lua
    Requires & Returns all files within the containers directory
]]

--//Require any modules and define variables

return {
    users = require("./containers/users"),
    groups = require("./containers/groups"),
}