-- Controlador principal do Anti-AFK

local AntiAFK = {}
AntiAFK.__index = AntiAFK

local Movement = require(script.Parent.Movement)
local Config = require(script.Parent.Config)
local Logger = require(script.Parent.Parent.utils.Logger)

function AntiAFK.new(player)
    local self = setmetatable({}, AntiAFK)
    self.player = player
    self.isRunning = false
    self.movement = Movement.new(Config)
    self.currentPattern = Config.MovementPatterns.Default
    return self
end

function AntiAFK:getCharacter()
    return self.player.Character
end

function AntiAFK:getHumanoid(character)
    if not character then
        return nil
    end
    return character:FindFirstChildOfClass("Humanoid")
end

function AntiAFK:getRootPart(character)
    if not character then
        return nil
    end
    return character:FindFirstChild("HumanoidRootPart")
end

function AntiAFK:start()
    if self.isRunning then
        Logger:warn("Anti-AFK já está em execução")
        return
    end
    
    self.isRunning = true
    Logger:info("Anti-AFK iniciado")
    self:run()
end

function AntiAFK:stop()
    self.isRunning = false
    self.movement:stop()
    Logger:info("Anti-AFK parado")
end

function AntiAFK:run()
    while self.isRunning do
        local character = self:getCharacter()
        local humanoid = self:getHumanoid(character)
        local rootPart = self:getRootPart(character)
        
        if humanoid and humanoid.Health > 0 and rootPart then
            self.movement:executePattern(humanoid, rootPart, self.currentPattern)
        else
            task.wait(1)
        end
    end
end

function AntiAFK:setPattern(patternName)
    if Config.MovementPatterns[patternName] then
        self.currentPattern = Config.MovementPatterns[patternName]
        Logger:info("Padrão de movimento alterado: " .. patternName)
        return true
    end
    return false
end

function AntiAFK:getStatus()
    return {
        running = self.isRunning,
        pattern = self.currentPattern,
        character = self:getCharacter() ~= nil,
    }
end

return AntiAFK
