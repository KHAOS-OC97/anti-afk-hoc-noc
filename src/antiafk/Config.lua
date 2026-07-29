-- Configurações específicas do sistema Anti-AFK

local AntiAFKConfig = {}

AntiAFKConfig.Enabled = true
AntiAFKConfig.AutoStartOnSpawn = true

-- Padrões de movimento
AntiAFKConfig.MovementPatterns = {
    Default = {
        moves = {
            { distance = 3, direction = Vector3.new(1, 0, 0), duration = 1.2 },
            { distance = 3, direction = Vector3.new(-1, 0, 0), duration = 1.2 },
            { distance = 3, direction = Vector3.new(0, 0, 1), duration = 1.2 },
            { distance = 3, direction = Vector3.new(0, 0, -1), duration = 1.2 },
        },
        jumpInterval = 2.4,
    }
}

-- Limites de segurança
AntiAFKConfig.Safety = {
    MaxCheckRetries = 5,
    CharacterCheckInterval = 1,
    IdleTimeout = 300, -- 5 minutos
}

return AntiAFKConfig
