print("loading")

if not game:IsLoaded() then
    game.Loaded:Wait()
end

repeat wait() 
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse

local Player = game.Players.LocalPlayer
local PlayerGui = Player.PlayerGui
local Character = Player.Character
local Humanoid = Character.Humanoid
local HR = Character.HumanoidRootPart

local Noclipping
_G.CLOSED = true
local claimingChests = false

print("stayfrosty", "lucky", "scramble", "OPE", "looks like", Player, "and mouse is connected!")


local allCodes = {"banana", "bandana", "nana", "underthesea", "spongebob", "gofast", "secrets", "season1", "bubblegum"}


--adding functions here!--
local function redeemCode(code)
    local args = {
    [1] = {
        [1] = {
            [1] = code
        },
        [2] = {
            [1] = false
        }
    }
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("redeem twitter code"):InvokeServer(unpack(args))
end

local function claimChests()
    local originalCFrame = HR.CFrame
    
    local chestPositions = {
    Vector3.new(-349, 14, -508), -- group rewards
    Vector3.new(-419, 50017, -583), -- xp chest
    Vector3.new(-401, 33384, -627), -- void chest
    Vector3.new(-398, 11352, -582), --Heaven Chest
    Vector3.new(-393, 972, -605), -- first chest
    Vector3.new(-594, 10, -557) -- VIP Chest
    }
    for i,v in pairs(chestPositions) do
        HR.CFrame = CFrame.new(v)
        task.wait(0.5)
    end
    
    for i = 1,2 do
        HR.CFrame = originalCFrame
        task.wait(0.3)
    end
end

local function claimAtlantisChests()
    local originalCFrame = HR.CFrame
    
    local chestPositions = {
    Vector3.new(-53, -6, 1272), -- Bottom chest
    Vector3.new(4, 1018, 1250), -- Coral chest
    Vector3.new(3, 25015, 1271), -- Deep Ocean chest
    Vector3.new(-0, 50107, 1271) --The Lost City Chest
    }
    for i,v in pairs(chestPositions) do
        HR.CFrame = CFrame.new(v)
        task.wait(1)
    end
    
    for i = 1,2 do
        HR.CFrame = originalCFrame
        task.wait(0.3)
    end
end

local function NoclipLoop()
    if noClip == true then
        for _, child in pairs(Character:GetDescendants()) do
            if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                child.CanCollide = false
            end
    	end
    end
end

local function blowBubble()
    local args = {
    [1] = {
    [1] = {
    [1] = false
    },
    [2] = {
    [1] = 2
    }
    }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("blow bubble"):FireServer(unpack(args))
end


local function getPickupFolders()
    local folders = {}
for i,v in pairs(game.Workspace.Stuff.Pickups:GetChildren()) do
    table.insert(folders, v)
end
return folders
end

local function getRainbows()
    local pickupFolders = getPickupFolders()
    local rainbows = {}
    for i,v in pairs(pickupFolders) do
        table.insert(rainbows, v:GetChildren()[1])
    end
    
    table.sort(rainbows, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.Position) < Player:DistanceFromCharacter(t2.Position) end)
    
    return rainbows
end

local function walkToClosestRainbow(moving)
    
    if moving then
        local rainbow = getRainbows()[1]
    
        Humanoid:MoveTo(rainbow.Position)
        Humanoid.MoveToFinished:Wait()
        return
    end
    
    local rainbow = getRainbows()[2]
    
    Humanoid:MoveTo(rainbow.Position)
    Humanoid.MoveToFinished:Wait()
    
end


local function getPetFromInventory(pet)
    local pets = {}
    
    for i,v in pairs(PlayerGui.Inventory.Frame.Container.Pets:GetChildren()) do
        if v:FindFirstChild("PetName") and v.PetName.Text == pet then
            table.insert(pets, v.Name)
        end
    end
    
    return pets
end

local function deletePet(pet)
    local pets = getPetFromInventory(pet)
    
    
    
    local args = {
    [1] = {
        [1] = {
            [1] = pets
        },
        [2] = {
            [1] = false
        }
    }
}

game:GetService("ReplicatedStorage").Remotes["delete pets"]:FireServer(unpack(args))

end

local function getNonShinyPetFromInventory(pet, amount)
    local pets = {}
    
    local count = 0
    local color = BrickColor.new()
    
    for i,v in pairs(PlayerGui.Inventory.Frame.Container.Pets:GetChildren()) do
        if v:FindFirstChild("PetName") and v.BackgroundColor3.r == 0 and v.PetName.Text == pet then
            table.insert(pets, v.Name)
            
            count = count + 1
            if count == amount then break end
            
        end
    end
    
    return pets
end

local function makePetShiny(pet, amount)
    local pets = getNonShinyPetFromInventory(pet, amount)
    
    local args = {
    [1] = {
        [1] = {
            [1] = pets
        },
        [2] = {
            [1] = false
        }
    }
}

game:GetService("ReplicatedStorage").Remotes["make pets shiny"]:InvokeServer(unpack(args))

end

local function claimSpin()
    local args = {
    [1] = {
        [1] = {
            [1] = false
        },
        [2] = {
            [1] = 2
        }
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("free wheel spin"):InvokeServer(unpack(args))


local args = {
    [1] = {
        [1] = {
            [1] = false
        },
        [2] = {
            [1] = 2
        }
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("free event wheel spin"):InvokeServer(unpack(args))


end


local function redeemFreeGifts()
    for i = 1,12 do
        task.wait()
        
        local args = {
        [1] = {
        [1] = {
        [1] = i
        },
        [2] = {
        [1] = false
        }
        }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("redeem free gift"):InvokeServer(unpack(args))
    end
end


local function sellBubble()
    local previousPosition = HR.CFrame
    local button = PlayerGui["Main Buttons"].Sell
    firesignal(button.Activated)
    task.wait(0.5)
    HR.CFrame = previousPosition
end

local function hatchEgg(egg)
    local args = {
    [1] = {
        [1] = {
            [1] = egg,
            [2] = true
        },
        [2] = {
            [1] = false,
            [2] = false
        }
    }
}

game:GetService("ReplicatedStorage").Remotes["buy egg"]:InvokeServer(unpack(args))

end



--now a couple functions to create the GUI--

local function createSpawnWorldEggList(parent)
    local Background = Instance.new("Frame")
    local CmdHandler = Instance.new("ScrollingFrame")
    Background.Name = "Background2"
    Background.Parent = parent
    Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Background.BorderSizePixel = 0
    Background.BorderColor3 = Color3.new(1,0,1)
    Background.Position = UDim2.new(1, 0, 0, 0)
    Background.Size = UDim2.new(0.6, 0, 1, 0)
    Background.Active = true
    Background.Visible = false
    
    CmdHandler.Name = "CmdHandler2"
    CmdHandler.Parent = Background
    CmdHandler.Active = true
    CmdHandler.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    CmdHandler.BackgroundTransparency = 1.000
    CmdHandler.BorderSizePixel = 0
    CmdHandler.AutomaticCanvasSize = "Y"
    CmdHandler.Position = UDim2.new(0, 0, 0.12, 0)
    CmdHandler.Size = UDim2.new(1, 0, 1, 0)
    CmdHandler.ScrollBarThickness = 4
    
    
    local YPos = 1
    for i,v in pairs(game:GetService("ReplicatedStorage")["Game Objects"].Eggs["Spawn World"]:GetChildren()) do
    print(v.Name)
    local Eggz = Instance.new("TextButton")
    Eggz.Name = v.Name
    Eggz.Position = UDim2.new(0,1,0,YPos)
    Eggz.Size = UDim2.new(1,0,0,25)
    Eggz.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Eggz.BorderColor3 = Color3.new(1,1,1)
    Eggz.ZIndex = 2
    Eggz.Parent = CmdHandler
    Eggz.Text = v.Name
    Eggz.TextColor3 = Color3.fromRGB(250,250,250)
    Eggz.TextScaled = true
    YPos = YPos + 25
    end
    
    for i,v in pairs(game:GetService("ReplicatedStorage")["Game Objects"].Eggs["Atlantis"]:GetChildren()) do
    print(v.Name)
    local Eggz = Instance.new("TextButton")
    Eggz.Name = v.Name
    Eggz.Position = UDim2.new(0,1,0,YPos)
    Eggz.Size = UDim2.new(1,0,0,25)
    Eggz.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Eggz.BorderColor3 = Color3.new(1,1,1)
    Eggz.ZIndex = 2
    Eggz.Parent = CmdHandler
    Eggz.Text = v.Name
    Eggz.TextColor3 = Color3.fromRGB(250,250,250)
    Eggz.TextScaled = true
    YPos = YPos + 25
    end
    
    return Background, CmdHandler
end

local function createMainBackground()
    local CmdGui = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local CmdHandler = Instance.new("ScrollingFrame")
    local Close = Instance.new("TextButton")
    local Minimum = Instance.new("TextButton")
    local CmdName = Instance.new("TextButton")

    if game:GetService("CoreGui"):findFirstChild("BGCGUI") then
        game:GetService("CoreGui"):findFirstChild("BGCGUI"):Destroy()
    end


    CmdGui.Name = "BGCGUI"
    CmdGui.Parent = game:GetService("CoreGui")
    
    Background.Name = "Background"
    Background.Parent = CmdGui
    Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Background.BorderSizePixel = 0
    Background.BorderColor3 = Color3.new(1,0,1)
    Background.Position = UDim2.new(0.01, 0, 0.68, 0)
    Background.Size = UDim2.new(.2, 0, .3, 0)
    Background.Active = true
    
    CmdHandler.Name = "CmdHandler"
    CmdHandler.Parent = Background
    CmdHandler.Active = true
    CmdHandler.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    CmdHandler.BackgroundTransparency = 1.000
    CmdHandler.BorderSizePixel = 0
    CmdHandler.AutomaticCanvasSize = "Y"
    CmdHandler.Position = UDim2.new(0, 0, 0.12, 0)
    CmdHandler.Size = UDim2.new(1, 0, 0.89, 0)
    CmdHandler.ScrollBarThickness = 4
    
    CmdName.Name = "CmdName"
    CmdName.AutoButtonColor = false
    CmdName.Parent = Background
    CmdName.BackgroundColor3 = Color3.fromRGB(10, 80, 180)
    CmdName.BorderSizePixel = 0
    CmdName.Size = UDim2.new(1, 0, .1, 0)
    CmdName.Font = Enum.Font.GothamBlack
    CmdName.Text = "BGC GUI"
    CmdName.TextColor3 = Color3.fromRGB(255, 255, 255)
    CmdName.TextScaled = true
    CmdName.TextSize = 14.000
    CmdName.TextWrapped = true
    Dragg = false
    
    CmdName.MouseButton1Down:Connect(function()Dragg = true while Dragg do game.TweenService:Create(Background, TweenInfo.new(.06), {Position = UDim2.new(0,mouse.X-40,0,mouse.Y-5)}):Play()wait()end end)
    CmdName.MouseButton1Up:Connect(function()Dragg = false end)
    
Minimum.Name = "Minimum"
Minimum.Parent = CmdName
Minimum.BackgroundColor3 = Color3.fromRGB(0, 155, 155)
Minimum.BorderSizePixel = 0
Minimum.Position = UDim2.new(.9, 0, 0, 0)
Minimum.AnchorPoint = Vector2.new(1,0)
Minimum.Size = UDim2.new(.1, 0, 1, 0)
Minimum.Font = Enum.Font.SourceSans
Minimum.Text = "-"
Minimum.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimum.TextSize = 14.000
Minimum.MouseButton1Click:Connect(function()
	if Background.BackgroundTransparency == 0 then
		Background.BackgroundTransparency = 1
	elseif Background.BackgroundTransparency == 1 then
		Background.BackgroundTransparency = 0
	end
end)

Close.Name = "Close"
Close.Parent = CmdName
Close.BackgroundColor3 = Color3.fromRGB(155, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(1, 0, 0, 0)
Close.AnchorPoint = Vector2.new(1,0)
Close.Size = UDim2.new(.1, 0, 1, 0)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 14.000
Close.MouseButton1Click:Connect(function()
    if noClip == true then
        Noclipping:Disconnect()
        noClip = false
    end
    _G.CLOSED = true
    CmdGui:Destroy()
end)

local textLabel = Instance.new("TextLabel")
textLabel.Parent = CmdHandler
textLabel.Size = UDim2.new(.9,0,.1,0)
textLabel.Position = UDim2.new(1, 0, 0, 0)
textLabel.AnchorPoint = Vector2.new(1,0)
textLabel.Text = "Auto blow bubble"
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundTransparency = 1
textLabel.TextScaled = true

local Item1 = Instance.new("TextButton")
Item1.Position = UDim2.new(0.1,0,0,1)
Item1.Size = UDim2.new(.1,0,.1,0)
Item1.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item1.BorderColor3 = Color3.new(1,1,1)
Item1.ZIndex = 2
Item1.Parent = CmdHandler
Item1.Text = ""
Item1.TextColor3 = Color3.fromRGB(250,250,250)
Item1.TextScaled = true
Item1.MouseButton1Click:Connect(function()
    if Item1.BackgroundColor3 == Color3.fromRGB(70,70,70) then
        Item1.BackgroundColor3 = Color3.fromRGB(200,70,70)
        repeat
            blowBubble()
            task.wait()
        until Item1.BackgroundColor3 == Color3.fromRGB(70,70,70) or _G.CLOSED
        return
    end
    Item1.BackgroundColor3 = Color3.fromRGB(70,70,70)
end)


local textLabel2 = Instance.new("TextLabel")
textLabel2.Parent = CmdHandler
textLabel2.Size = UDim2.new(.8,0,.1,0)
textLabel2.Position = UDim2.new(1, 0, 1.05, 0)
textLabel2.AnchorPoint = Vector2.new(1,0)
textLabel2.Text = "Teleport Straight UP 500 studs"
textLabel2.TextColor3 = Color3.new(1, 1, 1)
textLabel2.BackgroundTransparency = 1
textLabel2.TextScaled = true

local Item2 = Instance.new("TextButton")
Item2.Position = UDim2.new(0.1,0,1.05,1)
Item2.Size = UDim2.new(.1,0,.1,0)
Item2.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item2.BorderColor3 = Color3.new(1,1,1)
Item2.ZIndex = 2
Item2.Parent = CmdHandler
Item2.Text = ""
Item2.TextColor3 = Color3.fromRGB(250,250,250)
Item2.TextScaled = true
Item2.MouseButton1Click:Connect(function()
    HR.CFrame = HR.CFrame + Vector3.new(0,5000,0)
end)



local textLabel3 = Instance.new("TextLabel")
textLabel3.Parent = CmdHandler
textLabel3.Size = UDim2.new(.8,0,.1,0)
textLabel3.Position = UDim2.new(1, 0, 1.2, 0)
textLabel3.AnchorPoint = Vector2.new(1,0)
textLabel3.Text = "Sell Bubbles Once"
textLabel3.TextColor3 = Color3.new(1, 1, 1)
textLabel3.BackgroundTransparency = 1
textLabel3.TextScaled = true

local Item3 = Instance.new("TextButton")
Item3.Position = UDim2.new(0.1,0,1.2,1)
Item3.Size = UDim2.new(.1,0,.1,0)
Item3.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item3.BorderColor3 = Color3.new(1,1,1)
Item3.ZIndex = 2
Item3.Parent = CmdHandler
Item3.Text = ""
Item3.TextColor3 = Color3.fromRGB(250,250,250)
Item3.TextScaled = true
Item3.MouseButton1Click:Connect(function()
    sellBubble()
end)


local textLabel4 = Instance.new("TextLabel")
textLabel4.Parent = CmdHandler
textLabel4.Size = UDim2.new(.8,0,.1,0)
textLabel4.Position = UDim2.new(1, 0, 1.35, 0)
textLabel4.AnchorPoint = Vector2.new(1,0)
textLabel4.Text = "Sell Bubbles Every 2 Minutes"
textLabel4.TextColor3 = Color3.new(1, 1, 1)
textLabel4.BackgroundTransparency = 1
textLabel4.TextScaled = true

local Item4 = Instance.new("TextButton")
Item4.Position = UDim2.new(0.1,0,1.35,1)
Item4.Size = UDim2.new(.1,0,.1,0)
Item4.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item4.BorderColor3 = Color3.new(1,1,1)
Item4.ZIndex = 2
Item4.Parent = CmdHandler
Item4.Text = ""
Item4.TextColor3 = Color3.fromRGB(250,250,250)
Item4.TextScaled = true
Item4.MouseButton1Click:Connect(function()
    if Item4.BackgroundColor3 == Color3.fromRGB(70,70,70) then
        Item4.BackgroundColor3 = Color3.fromRGB(200,70,70)
        repeat
            sellBubble()
            task.wait(300)
        until Item4.BackgroundColor3 == Color3.fromRGB(70,70,70) or _G.CLOSED
        return
    end
    Item4.BackgroundColor3 = Color3.fromRGB(70,70,70)
end)


local textLabel5 = Instance.new("TextLabel")
textLabel5.Parent = CmdHandler
textLabel5.Size = UDim2.new(.8,0,.1,0)
textLabel5.Position = UDim2.new(1, 0, 0.15, 0)
textLabel5.AnchorPoint = Vector2.new(1,0)
textLabel5.Text = "Auto Prize Wheel"
textLabel5.TextColor3 = Color3.new(1, 1, 1)
textLabel5.BackgroundTransparency = 1
textLabel5.TextScaled = true

local Item5 = Instance.new("TextButton")
Item5.Position = UDim2.new(0.1,0,0.15,1)
Item5.Size = UDim2.new(.1,0,.1,0)
Item5.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item5.BorderColor3 = Color3.new(1,1,1)
Item5.ZIndex = 2
Item5.Parent = CmdHandler
Item5.Text = ""
Item5.TextColor3 = Color3.fromRGB(250,250,250)
Item5.TextScaled = true
Item5.MouseButton1Click:Connect(function()
    if Item5.BackgroundColor3 == Color3.fromRGB(70,70,70) then
        Item5.BackgroundColor3 = Color3.fromRGB(200,70,70)
        repeat
            claimSpin()
            task.wait(300)
        until Item5.BackgroundColor3 == Color3.fromRGB(70,70,70) or _G.CLOSED
        return
    end
    Item5.BackgroundColor3 = Color3.fromRGB(70,70,70)
end)


local textLabel6 = Instance.new("TextLabel")
textLabel6.Parent = CmdHandler
textLabel6.Size = UDim2.new(.8,0,.1,0)
textLabel6.Position = UDim2.new(1, 0, 0.3, 0)
textLabel6.AnchorPoint = Vector2.new(1,0)
textLabel6.Text = "Auto Claim Chests (main area)"
textLabel6.TextColor3 = Color3.new(1, 1, 1)
textLabel6.BackgroundTransparency = 1
textLabel6.TextScaled = true

local Item6 = Instance.new("TextButton")
Item6.Position = UDim2.new(0.1,0,0.3,1)
Item6.Size = UDim2.new(.1,0,.1,0)
Item6.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item6.BorderColor3 = Color3.new(1,1,1)
Item6.ZIndex = 2
Item6.Parent = CmdHandler
Item6.Text = ""
Item6.TextColor3 = Color3.fromRGB(250,250,250)
Item6.TextScaled = true
Item6.MouseButton1Click:Connect(function()
    if Item6.BackgroundColor3 == Color3.fromRGB(70,70,70) then
        Item6.BackgroundColor3 = Color3.fromRGB(200,70,70)
        repeat
            claimingChests = true
            claimChests()
            claimingChests = false
            task.wait(920)
        until Item6.BackgroundColor3 == Color3.fromRGB(70,70,70) or _G.CLOSED
        return
    end
    Item6.BackgroundColor3 = Color3.fromRGB(70,70,70)
end)


local background, handler = createSpawnWorldEggList(Background)

local Eggs = Instance.new("TextButton")
Eggs.Parent = CmdHandler
Eggs.Size = UDim2.new(.8,0,.1,0)
Eggs.Position = UDim2.new(0.5, 0, 0.6, 0)
Eggs.AnchorPoint = Vector2.new(.5,0)
Eggs.Text = "Open Eggs >"
Eggs.TextColor3 = Color3.new(1, 1, 1)
Eggs.BackgroundTransparency = 0
Eggs.BackgroundColor3 = Color3.fromRGB(20,20,20)
Eggs.BorderColor3 = Color3.fromRGB(255,255,255)
Eggs.BorderSizePixel = 2
Eggs.TextScaled = true
Eggs.MouseButton1Click:Connect(function()
    print(background.Visible)
    if background.Visible == true then
        Eggs.Text = "Open Eggs >"
        Eggs.BackgroundColor3 = Color3.fromRGB(20,20,20)
        background.Visible = false
        return
    end
    Eggs.Text = "Open Eggs <"
    Eggs.BackgroundColor3 = Color3.fromRGB(150,150,150)
    background.Visible = true
end)

for i,v in pairs(handler:GetChildren()) do
    v.MouseButton1Click:Connect(function()
        if Eggies then
            Eggies = false
            v.BackgroundColor3 = Color3.fromRGB(70,70,70)
            Plr.PlayerGui.ScreenGui.Enabled = true
            wait(3)
            Plr.PlayerGui.ScreenGui.Enabled = true
        else
            Eggies = true
            v.BackgroundColor3 = Color3.new(0,1,1)
            while Eggies  do
                task.wait()
                hatchEgg(v.Name)
            end
        end
    end)
end

local textLabel8 = Instance.new("TextLabel")
textLabel8.Parent = CmdHandler
textLabel8.Size = UDim2.new(.8,0,.1,0)
textLabel8.Position = UDim2.new(1, 0, 0.75, 0)
textLabel8.AnchorPoint = Vector2.new(1,0)
textLabel8.Text = "Auto Claim Chests (Atlantis)"
textLabel8.TextColor3 = Color3.new(1, 1, 1)
textLabel8.BackgroundTransparency = 1
textLabel8.TextScaled = true

local Item8 = Instance.new("TextButton")
Item8.Position = UDim2.new(0.1,0,0.75,1)
Item8.Size = UDim2.new(.1,0,.1,0)
Item8.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item8.BorderColor3 = Color3.new(1,1,1)
Item8.ZIndex = 2
Item8.Parent = CmdHandler
Item8.Text = ""
Item8.TextColor3 = Color3.fromRGB(250,250,250)
Item8.TextScaled = true
Item8.MouseButton1Click:Connect(function()
    if Item8.BackgroundColor3 == Color3.fromRGB(70,70,70) then
        Item8.BackgroundColor3 = Color3.fromRGB(200,70,70)
        repeat
            claimingChests = true
            claimAtlantisChests()
            claimingChests = false
            task.wait(920)
        until Item8.BackgroundColor3 == Color3.fromRGB(70,70,70) or _G.CLOSED
        return
    end
    Item8.BackgroundColor3 = Color3.fromRGB(70,70,70)
end)


local textLabel9 = Instance.new("TextLabel")
textLabel9.Parent = CmdHandler
textLabel9.Size = UDim2.new(.55,0,.1,0)
textLabel9.Position = UDim2.new(.65, 0, 0.9, 0)
textLabel9.AnchorPoint = Vector2.new(.8,0)
textLabel9.Text = "Make Hellhounds Shiny"
textLabel9.TextColor3 = Color3.new(1, 1, 1)
textLabel9.BackgroundTransparency = 1
textLabel9.TextScaled = true

local textBox9 = Instance.new("TextBox")
textBox9.Position = UDim2.new(1, 0, 0.9, 0)
textBox9.Size = UDim2.new(.2,0,.1,0)
textBox9.BackgroundColor3 = Color3.fromRGB(50,50,50)
textBox9.BorderSizePixel = 1
textBox9.BorderColor3 = Color3.new(1,1,1)
textBox9.AnchorPoint = Vector2.new(1,0)
textBox9.ZIndex = 2
textBox9.Parent = CmdHandler
textBox9.Text = ""
textBox9.PlaceholderText = "Amount to use"
textBox9.TextColor3 = Color3.fromRGB(250,250,250)
textBox9.TextScaled = true

local Item9 = Instance.new("TextButton")
Item9.Position = UDim2.new(0.1,0,0.9,1)
Item9.Size = UDim2.new(.1,0,.1,0)
Item9.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item9.BorderColor3 = Color3.new(1,1,1)
Item9.ZIndex = 2
Item9.Parent = CmdHandler
Item9.Text = ""
Item9.TextColor3 = Color3.fromRGB(250,250,250)
Item9.TextScaled = true
Item9.MouseButton1Click:Connect(function()
    if Item9.BackgroundColor3 == Color3.fromRGB(70,70,70) then
        Item9.BackgroundColor3 = Color3.fromRGB(200,70,70)
        repeat
            makePetShiny("S2 Hellhound", tonumber(textBox9.Text))
            task.wait(60)
        until Item9.BackgroundColor3 == Color3.fromRGB(70,70,70) or _G.CLOSED
        return
    end
    Item9.BackgroundColor3 = Color3.fromRGB(70,70,70)
end)


local textLabel10 = Instance.new("TextLabel")
textLabel10.Parent = CmdHandler
textLabel10.Size = UDim2.new(.8,0,.1,0)
textLabel10.Position = UDim2.new(1, 0, 0.45, 0)
textLabel10.AnchorPoint = Vector2.new(1,0)
textLabel10.Text = "Auto Walk To Nearby Currency"
textLabel10.TextColor3 = Color3.new(1, 1, 1)
textLabel10.BackgroundTransparency = 1
textLabel10.TextScaled = true

local Item10 = Instance.new("TextButton")
Item10.Position = UDim2.new(0.1,0,0.45,1)
Item10.Size = UDim2.new(.1,0,.1,0)
Item10.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item10.BorderColor3 = Color3.new(1,1,1)
Item10.ZIndex = 2
Item10.Parent = CmdHandler
Item10.Text = ""
Item10.TextColor3 = Color3.fromRGB(250,250,250)
Item10.TextScaled = true
Item10.MouseButton1Click:Connect(function()
    if Item10.BackgroundColor3 == Color3.fromRGB(70,70,70) then
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        noClip = true
        
        local pos
        local notMoving = 0
        Item10.BackgroundColor3 = Color3.fromRGB(200,70,70)
        repeat
            if HR.Position == pos then
                notMoving = notMoving + 1
            else
                notMoving = 1
            end
            
            pos = HR.Position
            
            if notMoving < 10 and claimingChests == false then
                walkToClosestRainbow(true)
            elseif claimingChests == false then
                walkToClosestRainbow(false)
            end
            
            task.wait()
        until Item10.BackgroundColor3 == Color3.fromRGB(70,70,70) or _G.CLOSED
        
        Noclipping:Disconnect()
        noClip = false
        return
    end
    Item10.BackgroundColor3 = Color3.fromRGB(70,70,70)
end)


local textLabel11 = Instance.new("TextLabel")
textLabel11.Parent = CmdHandler
textLabel11.Size = UDim2.new(.8,0,.1,0)
textLabel11.Position = UDim2.new(1, 0, 1.5, 0)
textLabel11.AnchorPoint = Vector2.new(1,0)
textLabel11.Text = "Redeem All Codes"
textLabel11.TextColor3 = Color3.new(1, 1, 1)
textLabel11.BackgroundTransparency = 1
textLabel11.TextScaled = true

local Item11 = Instance.new("TextButton")
Item11.Position = UDim2.new(0.1,0,1.5,1)
Item11.Size = UDim2.new(.1,0,.1,0)
Item11.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item11.BorderColor3 = Color3.new(1,1,1)
Item11.ZIndex = 2
Item11.Parent = CmdHandler
Item11.Text = ""
Item11.TextColor3 = Color3.fromRGB(250,250,250)
Item11.TextScaled = true
Item11.MouseButton1Click:Connect(function()
    for i,v in pairs(allCodes) do
        redeemCode(v)
    end
end)

end

task.wait(0.5)
_G.CLOSED = false
createMainBackground()
