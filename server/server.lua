local VorpCore = {}
local VorpInv = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()


Citizen.CreateThread(function()
	Wait(500)
	for k,v in pairs(Config.items) do 
		VorpInv.RegisterUsableItem(k, function(data)
			if v.pipe then 
				local count = VorpInv.getItemCount(data.source, Config.pipeitem)
				if count >= 1 then
					TriggerClientEvent('556_cigpack:doit', data.source,v.type, v.high, v.hightype, v.highduration)

					return 
				else 
					TriggerClientEvent("vorp:TipRight", data.source, Config.Texts.NeedPipe, 3000)
					return 
				end
			else
				TriggerClientEvent('556_cigpack:doit', data.source,v.type, v.high, v.hightype, v.highduration)
				VorpInv.CloseInv(data.source)
			end
			if v.pack then
				local pack = VorpInv.getItem(data.source, k)
				if pack ~= nil then
				local meta =  pack["metadata"]
				if next(meta) == nil then 
					VorpInv.subItem(data.source, k, 1,{})
					local drb = Config.PackContains - 1
					VorpInv.addItem(data.source, k, 1,{description = Config.Texts.Durability..""..drb,durability = drb})
				else
					local durability = meta.durability - Config.LooseEachUse
					VorpInv.subItem(data.source, k, 1, meta)
					if 0 >= durability then 
							return
					else
						print(durability)
						VorpInv.addItem(data.source, k, 1,{description = Config.Texts.Durability..durability,durability = durability})
					end
				end
			end
			else
				VorpInv.subItem(data.source, k, 1)
			end
		end)
	end
end)