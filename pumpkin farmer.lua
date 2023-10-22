local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

while task.wait() do
    coroutine.wrap(function()
        for _,v in pairs(workspace:GetChildren()) do
        	if v:IsA("Part") and v:FindFirstChild("Mesh") then
        		character:MoveTo(v.Position)
        	end
        end
    end)()
end
