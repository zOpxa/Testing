local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("WestBound Haxs ~ By Twisted", "Sentinel")

local Tab1 = Window:NewTab("Main")

local Section1 = Tab1:NewSection("Gun-Stats")
local Section2 = Tab1:NewSection("Player Options")



-- Section 1 
Section1:NewButton("Gun-Stats Sir", "0", function()
local stats = require(game:GetService("ReplicatedStorage").GunScripts.GunStats)

local gunName = "Colt Navy"
stats[gunName].GunType = "Pistol"
stats[gunName].MaxShots = 150
stats[gunName].ReloadSpeed = 0
stats[gunName].Damage = 95
stats[gunName].equipTime = 0
stats[gunName].prepTime = 0
stats[gunName].HipFireAccuracy = 75
stats[gunName].BulletSpeed = 100

local gunName = "Winchester Rifle"
stats[gunName].GunType = "Rifle"
stats[gunName].MaxShots = 150
stats[gunName].ReloadSpeed = 0
stats[gunName].Damage = 95
stats[gunName].equipTime = 0
stats[gunName].prepTime = 0
stats[gunName].HipFireAccuracy = 75
stats[gunName].BulletSpeed = 100

local gunName = "Pump-action Shotgun"
stats[gunName].GunType = "Shotgun"
stats[gunName].MaxShots = 150
stats[gunName].ReloadSpeed = 0
stats[gunName].Damage = 95
stats[gunName].equipTime = 0
stats[gunName].prepTime = 0
stats[gunName].HipFireAccuracy = 75
stats[gunName].BulletSpeed = 100


end)
-- End Section 1 


-- Section 2 Function Start
Section2:NewButton("Player ESP", "0", function()

    local esp_settings = { ---- table for esp settings 
    textsize = 20,
    colour = 255, 0, 254
}

local gui = Instance.new("BillboardGui")
local esp = Instance.new("TextLabel",gui) ---- new instances to make the billboard gui and the textlabel



gui.Name = "ESP"; ---- properties of the esp
gui.ResetOnSpawn = false
gui.AlwaysOnTop = true;
gui.LightInfluence = 0;
gui.Size = UDim2.new(1.75, 0, 1.75, 0);
esp.BackgroundColor3 = Color3.fromRGB(255, 0, 254);
esp.Text = ""
esp.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001);
esp.BorderSizePixel = 4;
esp.BorderColor3 = Color3.new(esp_settings.colour)
esp.BorderSizePixel = 0
esp.Font = "FredokaOne"
esp.TextSize = esp_settings.textsize
esp.TextColor3 = Color3.fromRGB(esp_settings.colour) -- text colour

game:GetService("RunService").RenderStepped:Connect(function() ---- loops faster than a while loop :)
    for i,v in pairs (game:GetService("Players"):GetPlayers()) do
        if v ~= game:GetService("Players").LocalPlayer and v.Character.Head:FindFirstChild("ESP")==nil  then -- craeting checks for team check, local player etc
            esp.Text = "{"..v.Name.."}"
            gui:Clone().Parent = v.Character.Head
    end
end
end)
end)
-- End of Section 2.

-- Section 2 Phrase 2 Function Start
Section2:NewButton("Player Chams", "0", function()
    local players = game:GetService('Players')
    local player = players.LocalPlayer
    local char = player.Character
    local switch = true
    
    local chams = function()
        switch = true
        local p = players:GetPlayers()
        for _, v in next, player.PlayerGui:GetChildren() do
            if v:IsA('Folder') and ( game:GetService('Players'):FindFirstChild(v.Name) or v:FindFirstChildOfClass('BoxHandleAdornment') ) then
                v:Destroy()
            end
        end
        for _, v in next, p do
            if v.Character ~= nil and v.Character:FindFirstChild('Head') ~= nil and v.TeamColor ~= player.TeamColor then
                if v ~= player then
                    local folder = Instance.new('Folder',player.PlayerGui)
                    folder.Name = v.Name
                    for _, part in pairs(v.Character:GetChildren()) do
                        if part:IsA('BasePart') then
                            local adorn = Instance.new('BoxHandleAdornment',folder)
                            adorn.Name = v.Name
                            if part.Name ~= 'Head' then
                                adorn.Size = part.Size
                            else
                                adorn.Size = (part.Size)-Vector3.new(part.Size.X/2,0,0)
                            end
                             adorn.Adornee = part
                            adorn.AlwaysOnTop = true
                            adorn.ZIndex = 5
                            adorn.Transparency = 0.2
                            adorn.Color = v.TeamColor
                            local adorn2 = Instance.new('BoxHandleAdornment',folder)
                            adorn2.Name = v.Name Color3.new(1,1,1)
                            if part.Name ~= 'Head' then
                                adorn2.Size = part.Size*8
                            else
                                adorn2.Size = (part.Size*8)-Vector3.new(part.Size.X/2,0,0)
                            end
                        end
                    end
                end
            end
        end
    end
    
    local turn_on = chams
    local turn_off = function()
        switch = false
        for _, v in next, player.PlayerGui:GetChildren() do
            if v:IsA('Folder') and ( game:GetService('Players'):FindFirstChild(v.Name) or v:FindFirstChildOfClass('BoxHandleAdornment') ) then
                v:Destroy()
            end
        end
    end
    
    
    
    turn_on()
        if switch then
            chams()
    end
end)
-- Section 2 Phrase 2 Function End
