local Framework = nil -- Don't change this.
local notifyScript = "print" -- Don't change this.

if GetResourceState("es_extended") ~= 'missing' then
    Framework = exports['es_extended']:getSharedObject()
    notifyScript = "default_ESX"
    if GetResourceState("ox_lib") ~= 'missing' then notifyScript = "ox_lib" end
elseif GetResourceState("qb-core") ~= 'missing' then
    Framework = exports['qb-core']:GetCoreObject()
    notifyScript = "default_QB"
    if GetResourceState("ox_lib") ~= 'missing' then notifyScript = "ox_lib" end
end

function Notify(playerId, message, type, length)
    if type == nil then type = 'info' end
    if length == nil then length = 5000 end
    if notifyScript ~= nil then
        if notifyScript == "ox_lib" then
            lib.notify(playerId, {title = "MH Cooldown", description = message, type = type})
        elseif notifyScript == "default_QB" then
            if Framework ~= nil then Framework.Functions.Notify({text = "MH Cooldown", caption = message}, type, length) end
        elseif notifyScript == "default_ESX" then
            if Framework ~= nil then Framework.ShowNotification("MH Cooldown\n"..message, type, length) end
        elseif notifyScript == "print" then
            if Framework == nil then print("MH Cooldown - "..message) end
        end
    end
end