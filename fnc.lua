local http = game:GetService("HttpService")
local req = http_request

if not req then
    warn("no function http")
end 

if not getgenv() then
    warn("no function getgenv")
end

local function WebHook(table)
    local H = table.Hook
    local N = table.Name
    local M = table.Message
    local C = table.Color

    local colors = {
        black = 0x000000,
        white = 0xFFFFFF,
        yellow = 0xFFFF00,
        cyan = 0x00FFFF,
        green = 0x00FF00,
        red = 0xFF0000,
        blue = 0x0000FF,
        orange = 0xFFA500,
        purple = 0x800080,
        pink = 0xFFC0CB,
        brown = 0x8B4513,
        lime = 0x32CD32,
        navy = 0x000080,
        gold = 0xFFD700,
        silver = 0xC0C0C0,
        gray = 0x808080
    }

    local emcolor = colors.dark

    if C and type(C) == "string" then
        local colorkey = string.lower(C) 
        emcolor = colors[colorkey] or colors.dark
    end

    local data = {
        username = N,
        embeds = {{
            description = M,
            color = emcolor
        }}
    }
    local json = http:JSONEncode(data)
    req({
        Url = H,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = json
    })
end

getgenv().WebHook = WebHook
return getgenv().WebHook

