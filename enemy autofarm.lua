local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function args(a)
	local gs = {
		[1] = "hit",
		[2] = {
			[1] = a,
			[2] = a.MaxHealth/4
		}
	}
	return gs
end

local function isaenemey(a)
	for _,v in pairs(a:GetDescendants()) do
		if v:IsA("Script") and v.Name == EnemyMain then
			return true
		end
	end
end

local function kill(a)
	local humanoid = a:FindFirstChild("Humanoid")
	if isaenemy(a) and humanoid and humanoid.Health ~= 0 then
		local swad = character:FindFirstChild("Sword") or player.Backpack:FindFirstChild("Sword")
		task.wait(1)
		swad.RemoteFunction:InvokeServer(unpack(args(humanoid)))
	end
end

for _,v in pairs(workspace:GetChildren()) do
	kill(v)
end

workspace.DescendantAdded:Connect(function(p)
	local humanoid = p:FindFirstChild("Humanoid")
	if not game:GetService("Players"):GetPlayerFromCharacter(v) and humanoid and humanoid.Health ~= 0 then
		local swad = character:FindFirstChild("Sword") or player.Backpack:FindFirstChild("Sword")
        task.wait(1)
        swad.RemoteFunction:InvokeServer(unpack(args(humanoid)))
	end
end)
