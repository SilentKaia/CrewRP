RegisterNetEvent("Scene:Recieve")
AddEventHandler("Scene:Recieve", function(scene, id)
	distancetimer = 0
	Scenes[id] = scene
end)

RegisterNetEvent("Scene:Cache")
AddEventHandler("Scene:Cache", function(cache)
	Cache.Time = cache.Time
end)

RegisterNetEvent("Scene:Delete")
AddEventHandler("Scene:Delete", function(id)
	Scenes[id] = nil
end)


RegisterNetEvent("Scene:Reset")
AddEventHandler("Scene:Reset", function()
	ResetScene()
end)

RegisterNetEvent("Scene:RecieveAll")
AddEventHandler("Scene:RecieveAll", function(scenes)
	distancetimer = 0
	Scenes = scenes
end)

RegisterNetEvent("Scene:Create")
AddEventHandler("Scene:Create", function(T)
	distancetimer = 0
	Scene.Text.Text = T
	if not Scene.State then
		Scene.State = "Placing"
	end
end)

LastCopiedScene = nil
RegisterNetEvent("Scene:RecieveCopy")
AddEventHandler("Scene:RecieveCopy", function(T)
	LastCopiedScene = T
	Scene = T
	if not Scene.State then
		Scene.State = "Placing"
	end
end)