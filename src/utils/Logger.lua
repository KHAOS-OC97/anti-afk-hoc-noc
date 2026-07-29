-- Sistema simples de logs

local Logger = {}

Logger.LogLevel = {
    INFO = "INFO",
    WARN = "WARN",
    ERROR = "ERROR",
    DEBUG = "DEBUG",
}

local function formatMessage(level, message)
    local timestamp = os.date("%H:%M:%S")
    return string.format("[%s] [%s] %s", timestamp, level, message)
end

function Logger:log(message, level)
    level = level or self.LogLevel.INFO
    local formatted = formatMessage(level, message)
    print(formatted)
end

function Logger:info(message)
    self:log(message, self.LogLevel.INFO)
end

function Logger:warn(message)
    self:log(message, self.LogLevel.WARN)
end

function Logger:error(message)
    self:log(message, self.LogLevel.ERROR)
end

function Logger:debug(message)
    self:log(message, self.LogLevel.DEBUG)
end

return Logger
