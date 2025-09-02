local Cooldown = {}
Cooldown.Players = {}

local function Notify(playerId, message, type, length)
    if GetResourceState("ox_lib") ~= 'missing' then
        lib.notify(playerId, {title = "MH Cooldown", description = message, type = type})
    else
        print("MH Cooldown - "..message)
    end
end

function Cooldown:Add(playerId)
    if self.Players[playerId] then return end
    if not self.Players[playerId] then self.Players[playerId] = {timer = nil, cooldown = false} end
end

function Cooldown:Remove(playerId)
    if not self.Players[playerId] then return end
    table.remove(self.Players, playerId)
end

function Cooldown:IsActive(playerId)
    if not self.Players[playerId] then return false end
    return self.Players[playerId].cooldown
end

function Cooldown:Run(playerId, cooldowntimer)
    self.Add(playerId)
    Wait(10)
    local timer = SV_Config.MinCooldownTimer
    if type(cooldowntimer) == 'number' then timer = tonumber(cooldowntimer) end
    if self.Players[playerId].timer == nil and not self.Players[playerId].cooldown then
        self.Players[playerId].timer = timer
        self.Players[playerId].cooldown = true
        Notify(playerId, Lang:t('cooldown_active'), "error", timer)
        SetTimeout(self.Players[playerId].timer, function()
            self.Players[playerId].cooldown = false
            self.Players[playerId].timer = nil
        end)
    elseif self.Players[playerId].timer ~= nil and self.Players[playerId].cooldown then
        return
    end
end

local function IsActive(playerId)
    return self.IsActive(playerId)
end
exports('IsActive', IsActive)

local function Run(playerId, timer)
    return self.Run(playerId, timer)
end
exports('Run', Run)

local function onPlayerConnecting(name, _, deferrals)
    local playerId = source
    Cooldown:Add(playerId)
end

AddEventHandler('playerConnecting', onPlayerConnecting)

AddEventHandler('playerDropped', function(reason)
    local playerId = source
    self.Remove(playerId)
end)