-- Sistema de movimento do Anti-AFK

local Movement = {}
Movement.__index = Movement

function Movement.new(config)
    local self = setmetatable({}, Movement)
    self.config = config or {}
    self.isMoving = false
    return self
end

function Movement:moveToDirection(humanoid, rootPart, distance, direction, duration)
    if not humanoid or humanoid.Health <= 0 or not rootPart then
        return false
    end
    
    local targetPosition = rootPart.Position + (direction.Unit * distance)
    humanoid:MoveTo(targetPosition)
    task.wait(duration)
    return true
end

function Movement:executePattern(humanoid, rootPart, pattern)
    if not humanoid or not rootPart then
        return false
    end
    
    for _, move in ipairs(pattern.moves) do
        if humanoid.Health <= 0 then
            break
        end
        
        self:moveToDirection(humanoid, rootPart, move.distance, move.direction, move.duration)
    end
    
    -- Pula
    if humanoid and humanoid.Health > 0 then
        humanoid.Jump = true
        task.wait(0.5)
    end
    
    return true
end

function Movement:stop()
    self.isMoving = false
end

return Movement
