function joindiscord()
    if not syn then return err("synapse only") end
    local json = {
        ["cmd"] = "INVITE_BROWSER",
            ["args"] = {
            ["code"] = "gAmAmJ7kUv"
        },
        ["nonce"] = 'a'
        }
    spawn(function()
        print(syn.request({
            Url = 'http://127.0.0.1:6463/rpc?v=1',
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json',
                ['Origin'] = 'https://discord.com'
              },
            Body = game:GetService('HttpService'):JSONEncode(json),
        }).Body)
    end)
end


Discord:CreateButton("Direct Join", joindiscord)

Discord:CreateButton("Copy to Clipboard", function() 
    if setclipboard then setclipboard('https://discord.gg/gAmAmJ7kUv') else print("gAmAmJ7kUv") 
    end 
end)
