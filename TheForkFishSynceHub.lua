-- FORK THE FISH HUB - SYNCEHUB UI
-- Created by SynceHub

local T=game:GetService("TweenService")
local P=game:GetService("Players").LocalPlayer
local TS=game:GetService("TextService")

-- Create ScreenGui
local G=Instance.new("ScreenGui")
G.Name="SynceHub_ForkFish"
G.ResetOnSpawn=false
G.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
G.IgnoreGuiInset=true
G.DisplayOrder=999
pcall(function()G.Parent=P:WaitForChild("PlayerGui")end)

-- Main Frame
local M=Instance.new("Frame")
M.Name="MainFrame"
M.Size=UDim2.new(0,480,0,270)
M.Position=UDim2.new(.5,-240,.5,-135)
M.BackgroundColor3=Color3.fromRGB(18,18,22)
M.BorderSizePixel=0
M.Active=true
M.Draggable=true
M.ClipsDescendants=true
M.ZIndex=1
M.Parent=G
Instance.new("UICorner",M).CornerRadius=UDim.new(0,12)

local MS=Instance.new("UIStroke")
MS.Color=Color3.fromRGB(40,40,45)
MS.Thickness=1
MS.Transparency=.3
MS.Parent=M

-- Header
local H=Instance.new("Frame")
H.Name="Header"
H.Size=UDim2.new(1,0,0,45)
H.BackgroundColor3=Color3.fromRGB(25,25,30)
H.BorderSizePixel=0
H.ZIndex=2
H.Parent=M
Instance.new("UICorner",H).CornerRadius=UDim.new(0,12)

local hcv=Instance.new("Frame")
hcv.Size=UDim2.new(1,0,0,12)
hcv.Position=UDim2.new(0,0,1,-12)
hcv.BackgroundColor3=Color3.fromRGB(25,25,30)
hcv.BorderSizePixel=0
hcv.ZIndex=2
hcv.Parent=H

local hl=Instance.new("Frame")
hl.Size=UDim2.new(1,0,0,1.5)
hl.Position=UDim2.new(0,0,1,0)
hl.BackgroundColor3=Color3.fromRGB(40,40,45)
hl.BorderSizePixel=0
hl.ZIndex=3
hl.Parent=H

local ti=Instance.new("TextLabel")
ti.Size=UDim2.new(.7,0,1,0)
ti.Position=UDim2.new(0,18,0,0)
ti.BackgroundTransparency=1
ti.Text="SynceScriptHub | Fork The Fish"
ti.TextColor3=Color3.fromRGB(240,240,245)
ti.TextSize=14
ti.Font=Enum.Font.GothamBold
ti.TextXAlignment=Enum.TextXAlignment.Left
ti.ZIndex=3
ti.Parent=H

-- Minimize Button
local mb=Instance.new("TextButton")
mb.Size=UDim2.new(0,32,0,32)
mb.Position=UDim2.new(1,-80,0,6.5)
mb.BackgroundColor3=Color3.fromRGB(32,32,37)
mb.Text=""
mb.ZIndex=3
mb.Parent=H
Instance.new("UICorner",mb).CornerRadius=UDim.new(0,8)

local mbs=Instance.new("UIStroke")
mbs.Color=Color3.fromRGB(45,45,50)
mbs.Thickness=1
mbs.Parent=mb

local mbi=Instance.new("Frame")
mbi.Size=UDim2.new(0,14,0,14)
mbi.Position=UDim2.new(.5,-7,.5,-7)
mbi.BackgroundTransparency=1
mbi.Parent=mb

local mbis=Instance.new("UIStroke")
mbis.Color=Color3.fromRGB(180,180,185)
mbis.Thickness=2
mbis.Parent=mbi
Instance.new("UICorner",mbi).CornerRadius=UDim.new(0,3)

-- Close Button
local cb=Instance.new("TextButton")
cb.Size=UDim2.new(0,32,0,32)
cb.Position=UDim2.new(1,-42,0,6.5)
cb.BackgroundColor3=Color3.fromRGB(32,32,37)
cb.Text=""
cb.ZIndex=3
cb.Parent=H
Instance.new("UICorner",cb).CornerRadius=UDim.new(0,8)

local cbs=Instance.new("UIStroke")
cbs.Color=Color3.fromRGB(45,45,50)
cbs.Thickness=1
cbs.Parent=cb

local cbi=Instance.new("Frame")
cbi.Size=UDim2.new(0,14,0,14)
cbi.Position=UDim2.new(.5,-7,.5,-7)
cbi.BackgroundTransparency=1
cbi.Rotation=45
cbi.Parent=cb

local cbis=Instance.new("UIStroke")
cbis.Color=Color3.fromRGB(180,180,185)
cbis.Thickness=2
cbis.Parent=cbi
Instance.new("UICorner",cbi).CornerRadius=UDim.new(0,2)

-- Tab Scrolling Frame
local sb=Instance.new("ScrollingFrame")
sb.Size=UDim2.new(1,0,0,48)
sb.Position=UDim2.new(0,0,0,48)
sb.BackgroundTransparency=1
sb.ScrollBarThickness=0
sb.CanvasSize=UDim2.new(0,550,0,0)
sb.ScrollingDirection=Enum.ScrollingDirection.X
sb.ZIndex=2
sb.Parent=M

-- Content Area
local ca=Instance.new("ScrollingFrame")
ca.Size=UDim2.new(1,-28,1,-108)
ca.Position=UDim2.new(0,14,0,100)
ca.BackgroundTransparency=1
ca.ScrollBarThickness=3
ca.ScrollBarImageColor3=Color3.fromRGB(45,45,50)
ca.CanvasSize=UDim2.new(0,0,0,0)
ca.AutomaticCanvasSize=Enum.AutomaticSize.Y
ca.ScrollingDirection=Enum.ScrollingDirection.Y
ca.ZIndex=2
ca.Parent=M

local cal=Instance.new("UIListLayout")
cal.SortOrder=Enum.SortOrder.LayoutOrder
cal.Padding=UDim.new(0,8)
cal.Parent=ca

-- Variables
local min=false
local cTab="Equipment"
local tS={}

-- PART 2: Helper Functions
-- Paste after Part 1

-- Clear Content Function
local function cc()
    for _,c in pairs(ca:GetChildren()) do 
        if not c:IsA("UIListLayout") then 
            c:Destroy() 
        end 
    end 
end

-- Create Icon Function
local function ci(i)
    local im=Instance.new("ImageLabel")
    im.Size=UDim2.new(0,18,0,18)
    im.BackgroundTransparency=1
    im.ZIndex=4
    im.ImageColor3=Color3.fromRGB(180,180,185)
    if i=="equip" then 
        im.Image="rbxassetid://6031071053"
    elseif i=="player" then 
        im.Image="rbxassetid://6031071053"
    elseif i=="misc" then 
        im.Image="rbxassetid://6031082533"
    elseif i=="info" then 
        im.Image="rbxassetid://6031082533"
    end
    return im 
end

-- Create Tab Button Function
local function csb(n,ic,x,fn)
    local tw=TS:GetTextSize(n,12,Enum.Font.GothamBold,Vector2.new(500,50)).X+48
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(0,tw,0,36)
    b.Position=UDim2.new(0,x,0,6)
    b.BackgroundColor3=Color3.fromRGB(35,35,40)
    b.Text=""
    b.AutoButtonColor=false
    b.ZIndex=3
    b.Parent=sb
    Instance.new("UICorner",b).CornerRadius=UDim.new(1,0)
    
    local bs=Instance.new("UIStroke")
    bs.Color=Color3.fromRGB(45,45,50)
    bs.Thickness=1
    bs.Parent=b
    
    local ct=Instance.new("Frame")
    ct.Size=UDim2.new(1,0,1,0)
    ct.BackgroundTransparency=1
    ct.ZIndex=4
    ct.Parent=b
    
    local icn=ci(ic)
    icn.Position=UDim2.new(0,10,.5,-9)
    icn.Parent=ct
    
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(1,-38,1,0)
    l.Position=UDim2.new(0,32,0,0)
    l.BackgroundTransparency=1
    l.Text=n
    l.TextColor3=Color3.fromRGB(160,160,165)
    l.TextSize=12
    l.Font=Enum.Font.GothamBold
    l.TextXAlignment=Enum.TextXAlignment.Left
    l.ZIndex=4
    l.Parent=ct
    
    b.MouseEnter:Connect(function()
        if cTab~=n then 
            T:Create(b,TweenInfo.new(.15),{BackgroundColor3=Color3.fromRGB(42,42,47)}):Play()
        end 
    end)
    
    b.MouseLeave:Connect(function()
        if cTab~=n then 
            T:Create(b,TweenInfo.new(.15),{BackgroundColor3=Color3.fromRGB(35,35,40)}):Play()
        end 
    end)
    
    b.MouseButton1Click:Connect(function()
        if cTab==n then return end
        cTab=n
        
        for _,c in pairs(sb:GetChildren()) do 
            if c:IsA("TextButton") then 
                T:Create(c,TweenInfo.new(.15),{BackgroundColor3=Color3.fromRGB(35,35,40)}):Play()
                local ct=c:FindFirstChild("Frame")
                if ct then 
                    local tl=ct:FindFirstChildOfClass("TextLabel")
                    if tl then 
                        T:Create(tl,TweenInfo.new(.15),{TextColor3=Color3.fromRGB(160,160,165)}):Play()
                    end
                    local ic=ct:FindFirstChildOfClass("ImageLabel")
                    if ic then 
                        T:Create(ic,TweenInfo.new(.15),{ImageColor3=Color3.fromRGB(180,180,185)}):Play()
                    end 
                end 
            end 
        end
        
        T:Create(b,TweenInfo.new(.15),{BackgroundColor3=Color3.fromRGB(200,200,205)}):Play()
        T:Create(l,TweenInfo.new(.15),{TextColor3=Color3.fromRGB(25,25,30)}):Play()
        T:Create(icn,TweenInfo.new(.15),{ImageColor3=Color3.fromRGB(25,25,30)}):Play()
        fn()
    end)
    
    return b,tw 
end

-- Create Button Function
local function cbtn(n,fn)
    local bf=Instance.new("Frame")
    bf.Size=UDim2.new(1,0,0,44)
    bf.BackgroundColor3=Color3.fromRGB(28,28,33)
    bf.BorderSizePixel=0
    bf.ZIndex=3
    bf.Parent=ca
    Instance.new("UICorner",bf).CornerRadius=UDim.new(0,8)
    
    local bfs=Instance.new("UIStroke")
    bfs.Color=Color3.fromRGB(40,40,45)
    bfs.Thickness=1
    bfs.Parent=bf
    
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(1,-24,1,-12)
    b.Position=UDim2.new(0,12,0,6)
    b.BackgroundColor3=Color3.fromRGB(120,100,220)
    b.Text=n
    b.TextColor3=Color3.fromRGB(240,240,245)
    b.TextSize=12
    b.Font=Enum.Font.GothamBold
    b.AutoButtonColor=false
    b.ZIndex=4
    b.Parent=bf
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
    
    b.MouseEnter:Connect(function()
        T:Create(b,TweenInfo.new(.15),{BackgroundColor3=Color3.fromRGB(130,110,230)}):Play()
    end)
    
    b.MouseLeave:Connect(function()
        T:Create(b,TweenInfo.new(.15),{BackgroundColor3=Color3.fromRGB(120,100,220)}):Play()
    end)
    
    b.MouseButton1Click:Connect(function()
        if fn then fn() end 
    end)
end

-- Create Toggle Function
local function ctg(n,d,fn)
    local tf=Instance.new("Frame")
    tf.Size=UDim2.new(1,0,0,44)
    tf.BackgroundColor3=Color3.fromRGB(28,28,33)
    tf.BorderSizePixel=0
    tf.ZIndex=3
    tf.Parent=ca
    Instance.new("UICorner",tf).CornerRadius=UDim.new(0,8)
    
    local tfs=Instance.new("UIStroke")
    tfs.Color=Color3.fromRGB(40,40,45)
    tfs.Thickness=1
    tfs.Parent=tf
    
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(1,-65,1,0)
    l.Position=UDim2.new(0,12,0,0)
    l.BackgroundTransparency=1
    l.Text=n
    l.TextColor3=Color3.fromRGB(200,200,205)
    l.TextSize=12
    l.Font=Enum.Font.GothamBold
    l.TextXAlignment=Enum.TextXAlignment.Left
    l.ZIndex=4
    l.Parent=tf
    
    local tb=Instance.new("TextButton")
    tb.Size=UDim2.new(0,42,0,24)
    tb.Position=UDim2.new(1,-50,.5,-12)
    tb.BackgroundColor3=d and Color3.fromRGB(120,100,220) or Color3.fromRGB(38,38,43)
    tb.Text=""
    tb.AutoButtonColor=false
    tb.ZIndex=4
    tb.Parent=tf
    Instance.new("UICorner",tb).CornerRadius=UDim.new(0,12)
    
    local ti=Instance.new("Frame")
    ti.Size=UDim2.new(0,20,0,20)
    ti.Position=d and UDim2.new(1,-22,.5,-10) or UDim2.new(0,2,.5,-10)
    ti.BackgroundColor3=Color3.fromRGB(245,245,250)
    ti.BorderSizePixel=0
    ti.ZIndex=5
    ti.Parent=tb
    Instance.new("UICorner",ti).CornerRadius=UDim.new(1,0)
    
    tS[n]=d
    
    tb.MouseButton1Click:Connect(function()
        tS[n]=not tS[n]
        local o=tS[n]
        T:Create(tb,TweenInfo.new(.2),{BackgroundColor3=o and Color3.fromRGB(120,100,220) or Color3.fromRGB(38,38,43)}):Play()
        T:Create(ti,TweenInfo.new(.25,Enum.EasingStyle.Back),{Position=o and UDim2.new(1,-22,.5,-10) or UDim2.new(0,2,.5,-10)}):Play()
        if fn then fn(o) end 
    end)
end

-- Create Input Function
local function cinp(n,mi,ma,d,fn)
    local inf=Instance.new("Frame")
    inf.Size=UDim2.new(1,0,0,44)
    inf.BackgroundColor3=Color3.fromRGB(28,28,33)
    inf.BorderSizePixel=0
    inf.ZIndex=3
    inf.Parent=ca
    Instance.new("UICorner",inf).CornerRadius=UDim.new(0,8)
    
    local infs=Instance.new("UIStroke")
    infs.Color=Color3.fromRGB(40,40,45)
    infs.Thickness=1
    infs.Parent=inf
    
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(.55,0,1,0)
    l.Position=UDim2.new(0,12,0,0)
    l.BackgroundTransparency=1
    l.Text=n
    l.TextColor3=Color3.fromRGB(200,200,205)
    l.TextSize=12
    l.Font=Enum.Font.GothamBold
    l.TextXAlignment=Enum.TextXAlignment.Left
    l.ZIndex=4
    l.Parent=inf
    
    local ib=Instance.new("TextBox")
    ib.Size=UDim2.new(0,75,0,28)
    ib.Position=UDim2.new(1,-83,.5,-14)
    ib.BackgroundColor3=Color3.fromRGB(35,35,40)
    ib.Text=tostring(d)
    ib.TextColor3=Color3.fromRGB(120,100,220)
    ib.TextSize=12
    ib.Font=Enum.Font.GothamBold
    ib.TextXAlignment=Enum.TextXAlignment.Center
    ib.PlaceholderText="Enter"
    ib.PlaceholderColor3=Color3.fromRGB(100,100,105)
    ib.ClearTextOnFocus=false
    ib.ZIndex=4
    ib.Parent=inf
    Instance.new("UICorner",ib).CornerRadius=UDim.new(0,6)
    
    local ibs=Instance.new("UIStroke")
    ibs.Color=Color3.fromRGB(45,45,50)
    ibs.Thickness=1
    ibs.Parent=ib
    
    ib.FocusLost:Connect(function()
        local v=tonumber(ib.Text)
        if v then 
            v=math.clamp(v,mi,ma)
            ib.Text=tostring(v)
            if fn then fn(v) end 
        else 
            ib.Text=tostring(d)
        end 
    end)
end

-- Create Info Function
local function cinfo(tt,bd)
    local pf=Instance.new("Frame")
    pf.Size=UDim2.new(1,0,0,0)
    pf.BackgroundColor3=Color3.fromRGB(28,28,33)
    pf.AutomaticSize=Enum.AutomaticSize.Y
    pf.BorderSizePixel=0
    pf.ZIndex=3
    pf.Parent=ca
    Instance.new("UICorner",pf).CornerRadius=UDim.new(0,8)
    
    local pfs=Instance.new("UIStroke")
    pfs.Color=Color3.fromRGB(40,40,45)
    pfs.Thickness=1
    pfs.Parent=pf
    
    local pt=Instance.new("TextLabel")
    pt.Size=UDim2.new(1,-24,0,24)
    pt.Position=UDim2.new(0,12,0,9)
    pt.BackgroundTransparency=1
    pt.Text=tt
    pt.TextColor3=Color3.fromRGB(220,220,225)
    pt.TextSize=12
    pt.Font=Enum.Font.GothamBold
    pt.TextXAlignment=Enum.TextXAlignment.Left
    pt.ZIndex=4
    pt.Parent=pf
    
    local pb=Instance.new("TextLabel")
    pb.Size=UDim2.new(1,-24,0,0)
    pb.Position=UDim2.new(0,12,0,33)
    pb.BackgroundTransparency=1
    pb.Text=bd
    pb.TextColor3=Color3.fromRGB(160,160,165)
    pb.TextSize=11
    pb.Font=Enum.Font.Gotham
    pb.TextXAlignment=Enum.TextXAlignment.Left
    pb.TextWrapped=true
    pb.AutomaticSize=Enum.AutomaticSize.Y
    pb.ZIndex=4
    pb.Parent=pf
    
    local pad=Instance.new("UIPadding")
    pad.PaddingBottom=UDim.new(0,11)
    pad.Parent=pf 
end

-- Notification Function
local function N(t,m)
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title=t;
        Text=m;
        Duration=2
    })
end

-- PART 3: Features & Tabs
-- Paste after Part 2

-- Equipment Functions
local R=game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ToolRE")
local function E(id)
    pcall(function()
        R:FireServer("Equip",{ID=id})
    end)
end

-- Create Tabs
local xPos=10

-- EQUIPMENT TAB
local b1,w1=csb("Equipment","equip",xPos,function()
    cc()
    
    cbtn("Equip Harpoon12 (Best)",function()
        N("Equipping","Harpoon12 equipped!")
        E("Harpoon12")
    end)
    
    cbtn("Equip Gun05 (Best)",function()
        N("Equipping","Gun05 equipped!")
        E("Gun05")
    end)
    
    cbtn("Equip FishBasket5 (Best)",function()
        N("Equipping","FishBasket5 equipped!")
        E("FishBasket5")
    end)
end)

xPos=xPos+w1+6

-- PLAYER TAB
local b2,w2=csb("Player","player",xPos,function()
    cc()
    
    cinp("WalkSpeed",16,200,16,function(v)
        local p=game.Players.LocalPlayer
        if p.Character and p.Character:FindFirstChild("Humanoid") then 
            p.Character.Humanoid.WalkSpeed=v 
        end 
    end)
    
    cinp("JumpPower",50,300,50,function(v)
        local p=game.Players.LocalPlayer
        if p.Character and p.Character:FindFirstChild("Humanoid") then 
            p.Character.Humanoid.JumpPower=v 
        end 
    end)
    
    ctg("God Mode",false,function(v)
        local p=game.Players.LocalPlayer
        if v then 
            if p.Character and p.Character:FindFirstChild("Humanoid") then 
                p.Character.Humanoid.MaxHealth=math.huge
                p.Character.Humanoid.Health=math.huge
                N("God Mode","Enabled!")
            end 
        else 
            if p.Character and p.Character:FindFirstChild("Humanoid") then 
                p.Character.Humanoid.MaxHealth=100
                p.Character.Humanoid.Health=100
                N("God Mode","Disabled!")
            end 
        end 
    end)
    
    ctg("Infinite Jump",false,function(v)
        _G.InfJump=v
        if v then 
            N("Infinite Jump","Enabled!")
        else 
            N("Infinite Jump","Disabled!")
        end 
    end)
end)

-- Infinite Jump Handler
game:GetService("UserInputService").JumpRequest:Connect(function()
    if _G.InfJump then 
        local p=game.Players.LocalPlayer
        if p.Character and p.Character:FindFirstChild("Humanoid") then 
            p.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end 
    end 
end)

xPos=xPos+w2+6

-- MISC TAB
local b3,w3=csb("Misc","misc",xPos,function()
    cc()
    
    ctg("Fullbright",false,function(v)
        if v then 
            game.Lighting.Brightness=2
            game.Lighting.ClockTime=14
            game.Lighting.FogEnd=100000
            game.Lighting.GlobalShadows=false
            game.Lighting.OutdoorAmbient=Color3.fromRGB(128,128,128)
            N("Fullbright","Enabled!")
        else 
            game.Lighting.Brightness=1
            game.Lighting.ClockTime=12
            game.Lighting.FogEnd=100000
            game.Lighting.GlobalShadows=true
            game.Lighting.OutdoorAmbient=Color3.fromRGB(70,70,70)
            N("Fullbright","Disabled!")
        end 
    end)
    
    cbtn("Remove Fog",function()
        game.Lighting.FogEnd=100000
        for _,v in pairs(game.Lighting:GetDescendants()) do 
            if v:IsA("Atmosphere") then 
                v:Destroy()
            end 
        end
        N("Fog Removed","Success!")
    end)
    
    cbtn("Rejoin Server",function()
        N("Rejoining","Please wait...")
        wait(1)
        game:GetService("TeleportService"):Teleport(game.PlaceId,game.Players.LocalPlayer)
    end)
    
    cbtn("Server Hop",function()
        N("Server Hop","Finding server...")
        local H=game:GetService("HttpService")
        local T=game:GetService("TeleportService")
        local A="https://games.roblox.com/v1/games/"
        local p=game.PlaceId
        local s=A..p.."/servers/Public?sortOrder=Asc&limit=100"
        
        local function L(c)
            local R=game:HttpGet(s..((c and "&cursor="..c) or ""))
            return H:JSONDecode(R)
        end
        
        local S,Ne
        repeat 
            local Sv=L(Ne)
            S=Sv.data[1]
            Ne=Sv.nextPageCursor 
        until S
        
        T:TeleportToPlaceInstance(p,S.id,game.Players.LocalPlayer)
    end)
end)

xPos=xPos+w3+6

-- CREDITS TAB
local b4,w4=csb("Credits","info",xPos,function()
    cc()
    
    cinfo("Fork The Fish Hub","Version: 1.0")
    
    cinfo("Created by","SynceHub\n\nThis script is made with passion and dedication for Fork The Fish players.\n\nThank you for using SynceHub!")
    
    cinfo("Features","Equipment Manager:\n• Harpoon12 (Best)\n• Gun05 (Best)\n• FishBasket5 (Best)\n\nPlayer Mods:\n• Custom WalkSpeed\n• Custom JumpPower\n• God Mode\n• Infinite Jump\n\nMisc:\n• Fullbright\n• Remove Fog\n• Rejoin Server\n• Server Hop")
    
    cinfo("UI Library","Custom SynceHub UI\nMinified & Optimized")
    
    cinfo("Important","Use at your own risk!\nMay trigger anti-cheat")
end)

-- Set Canvas Size
sb.CanvasSize=UDim2.new(0,xPos+w4+10,0,0)

-- PART 4: Button Handlers & Initialization
-- Paste after Part 3

-- Show Button (when minimized to icon)
local shw=Instance.new("TextButton")
shw.Size=UDim2.new(0,42,0,42)
shw.Position=UDim2.new(0,15,.5,-21)
shw.BackgroundColor3=Color3.fromRGB(28,28,33)
shw.Text=""
shw.ZIndex=10
shw.Visible=false
shw.Active=true
shw.Draggable=true
shw.Parent=G
Instance.new("UICorner",shw).CornerRadius=UDim.new(0,10)

local shws=Instance.new("UIStroke")
shws.Color=Color3.fromRGB(45,45,50)
shws.Thickness=1
shws.Parent=shw

local shi=Instance.new("ImageLabel")
shi.Size=UDim2.new(0,24,0,24)
shi.Position=UDim2.new(.5,-12,.5,-12)
shi.BackgroundTransparency=1
shi.Image="rbxassetid://6031079158"
shi.ImageColor3=Color3.fromRGB(200,200,205)
shi.ZIndex=11
shi.Parent=shw

shw.MouseEnter:Connect(function()
    T:Create(shw,TweenInfo.new(.15),{BackgroundColor3=Color3.fromRGB(35,35,40)}):Play()
end)

shw.MouseLeave:Connect(function()
    T:Create(shw,TweenInfo.new(.15),{BackgroundColor3=Color3.fromRGB(28,28,33)}):Play()
end)

shw.MouseButton1Click:Connect(function()
    shw.Visible=false
    M.Visible=true
    M.Size=UDim2.new(0,0,0,0)
    M.Position=UDim2.new(.5,0,.5,0)
    min=false
    sb.Visible=true
    ca.Visible=true
    hl.Visible=true
    hcv.Visible=true
    T:Create(M,TweenInfo.new(.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
        Size=UDim2.new(0,480,0,270),
        Position=UDim2.new(.5,-240,.5,-135)
    }):Play()
end)

-- Minimize Button Handler
mb.MouseButton1Click:Connect(function()
    min=not min
    if min then 
        T:Create(M,TweenInfo.new(.22),{Size=UDim2.new(0,480,0,45)}):Play()
        sb.Visible=false
        ca.Visible=false
        hl.Visible=false 
    else 
        T:Create(M,TweenInfo.new(.22),{Size=UDim2.new(0,480,0,270)}):Play()
        task.wait(.1)
        sb.Visible=true
        ca.Visible=true
        hl.Visible=true 
    end
    hcv.Visible=not min 
end)

-- Close Button Handler
cb.MouseButton1Click:Connect(function()
    T:Create(M,TweenInfo.new(.25,Enum.EasingStyle.Back,Enum.EasingDirection.In),{
        Size=UDim2.new(0,0,0,0),
        Position=UDim2.new(.5,0,.5,0)
    }):Play()
    task.wait(.25)
    M.Visible=false
    min=false
    sb.Visible=true
    ca.Visible=true
    hl.Visible=true
    hcv.Visible=true
    shw.Visible=true
    shw.Size=UDim2.new(0,0,0,0)
    T:Create(shw,TweenInfo.new(.28,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
        Size=UDim2.new(0,42,0,42)
    }):Play()
end)

-- Minimize Button Hover
mb.MouseEnter:Connect(function()
    T:Create(mb,TweenInfo.new(.12),{BackgroundColor3=Color3.fromRGB(38,38,43)}):Play()
    T:Create(mbis,TweenInfo.new(.12),{Color=Color3.fromRGB(220,220,225)}):Play()
end)

mb.MouseLeave:Connect(function()
    T:Create(mb,TweenInfo.new(.12),{BackgroundColor3=Color3.fromRGB(32,32,37)}):Play()
    T:Create(mbis,TweenInfo.new(.12),{Color=Color3.fromRGB(180,180,185)}):Play()
end)

-- Close Button Hover
cb.MouseEnter:Connect(function()
    T:Create(cb,TweenInfo.new(.12),{BackgroundColor3=Color3.fromRGB(38,38,43)}):Play()
    T:Create(cbis,TweenInfo.new(.12),{Color=Color3.fromRGB(220,220,225)}):Play()
end)

cb.MouseLeave:Connect(function()
    T:Create(cb,TweenInfo.new(.12),{BackgroundColor3=Color3.fromRGB(32,32,37)}):Play()
    T:Create(cbis,TweenInfo.new(.12),{Color=Color3.fromRGB(180,180,185)}):Play()
end)

-- Initialize GUI with Animation
M.Size=UDim2.new(0,0,0,0)
M.Position=UDim2.new(.5,0,.5,0)

T:Create(M,TweenInfo.new(.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
    Size=UDim2.new(0,480,0,270),
    Position=UDim2.new(.5,-240,.5,-135)
}):Play()

task.wait(.45)

-- Set Equipment Tab as Default Active
b1.BackgroundColor3=Color3.fromRGB(200,200,205)
local ct1=b1:FindFirstChild("Frame")
if ct1 then 
    local tl=ct1:FindFirstChildOfClass("TextLabel")
    if tl then 
        tl.TextColor3=Color3.fromRGB(25,25,30)
    end
    local ic=ct1:FindFirstChildOfClass("ImageLabel")
    if ic then 
        ic.ImageColor3=Color3.fromRGB(25,25,30)
    end 
end

-- Load Default Tab (Equipment)
cbtn("Equip Harpoon12 (Best)",function()
    N("Equipping","Harpoon12 equipped!")
    E("Harpoon12")
end)

cbtn("Equip Gun05 (Best)",function()
    N("Equipping","Gun05 equipped!")
    E("Gun05")
end)

cbtn("Equip FishBasket5 (Best)",function()
    N("Equipping","FishBasket5 equipped!")
    E("FishBasket5")
end)

-- Success Notification
N("SynceHub","Fork The Fish Hub loaded!")

print("SynceHub - Fork The Fish Hub v1.0 Loaded!")
print("Created by SynceHub")