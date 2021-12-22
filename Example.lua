local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local SciprsWindow = Library:NewWindow("Stuff")

--Discrod Joiner
local Discord = SciprsWindow:NewSection("Discord")

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


--server stuff

local ServerStuff = SciprsWindow:NewSection("Server")

ServerStuff:CreateButton("Rejoin", function()
if #Players:GetPlayers() <= 1 then
Players.LocalPlayer:Kick("\nRejoining...")
wait()
   game:GetService('TeleportService'):Teleport(game.PlaceId, Players.LocalPlayer)
    else
    game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
    end
end)
        
ServerStuff:CreateButton("Join Smallest Server", function()
                if syn then 
                    local function js(i)return game:GetService("HttpService"):JSONDecode(i)end

local index = 0
local maxplrs = 30
local lowestID
while index do
    if index == 0 then index = "" end
    local res = syn.request{
        Url = "https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/Public?sortOrder=Asc&limit=100&cursor="..index,
        Method = "GET"
    }
    for i,v in next, js(res.Body).data do
        if v.playing < maxplrs then
            maxplrs = v.playing
            print(maxplrs)
            lowestID = v.id
        end
    end
    index = js(res.Body).nextPageCursor
    wait()
end
wait()
game:GetService("TeleportService"):TeleportToPlaceInstance(2317712696,tostring(lowestID))
                else
                    print("Sorry, this function is Synapse only")
                end
end)
        
ServerStuff:CreateButton("Server Hop", function()
                local x = {}
	                for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
         		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
            			x[#x + 1] = v.id
            		end
            	end
            	if #x > 0 then
            		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
            	else
            		return print("Couldn't find a server")
            	end
end)
        






