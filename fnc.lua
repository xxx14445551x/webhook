local http = game:GetService("HttpService")
local req = http_request

if not req then
    warn("no function http")
end 

_G.webhook = function(hook, mes)
    local data = {
        embeds = {{
            description = mes
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

