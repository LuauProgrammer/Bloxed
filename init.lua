--[[   
    LuauProgrammer
    init.lua
    Requires & Returns all files within the containers directory
]]

return {
    require("./containers/users"),
    require("./containers/groups"),
    require("./containers/authentication"),
    require("./containers/games"),
}
