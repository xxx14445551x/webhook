local http = game:GetService("HttpService")
local req = http_request

if not req then
    warn("no function http")
end 

_G.webhook = function(hook, color, name , mes)
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

    if color and type(color) == "string" then
        local colorkey = string.lower(color) 
        emcolor = colors[colorkey] or colors.dark
    end

    local data = {
        username = name .. " ✦",
        embeds = {{
            description = mes,
            color = emcolor
        }}
    }
    local json = http:JSONEncode(data)
    req({
        Url = hook,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = json
    })
end
