local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

while true do task.wait()
    coroutine.wrap(function()
        for _,v in pairs(workspace:FindFirstChild("Mine"):GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Ore") then
                local args = {
					[1] = "hit",
					[2] = {
						[1] = v:WaitForChild("Ore"),
						[2] = math.huge
					}
				}
				local pick = character:FindFirstChild("Scrap Pickaxe") or player.Backpack:FindFirstChild("Scrap Pickaxe")
				pick.RemoteFunction:InvokeServer(unpack(args))
            end
        end
    end)()
end
