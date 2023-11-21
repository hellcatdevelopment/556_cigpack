RegisterNetEvent("556_cigpack:doit")
AddEventHandler("556_cigpack:doit", function(typeof, high, hightype, highduration)
    local type = typeof
    local high = high
    local hightype = hightype
    local highduration = highduration

    if type == "cigarette" then
            Cigarette(high, hightype, highduration)
    elseif type == "joint" then
            Joint(high, hightype, highduration)
    elseif type == "cigar" then
            Cigar(high, hightype, highduration)
    elseif type == "pipe" then
            Pipe(high, hightype, highduration)
    end
end)

function Cigarette() 
    local ped = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(ped, true))

    local cigarette = CreateObject(GetHashKey('P_CIGARETTE01X'), x, y, z + 0.2, true, true, true)
    local righthand = GetEntityBoneIndexByName(ped, "SKEL_R_Finger13")
    local mouth = GetEntityBoneIndexByName(ped, "skel_head")

    local promptGroup = UipromptGroup:new(Config.Texts.Cigarette)
    local smokePrompt = Uiprompt:new("INPUT_DYNAMIC_SCENARIO", Config.Texts.Smoke, promptGroup)
    smokePrompt:setHoldMode(true)
    local throwPrompt = Uiprompt:new("INPUT_CONTEXT_B", Config.Texts.PutOut, promptGroup)

    smokePrompt:setOnHoldModeJustCompleted(function(group, prompt)
        if not IsEntityPlayingAnim(ped, "amb_rest@world_human_smoking@male_c@stand_enter", "enter_back_rf") then
            Anim(ped, "amb_rest@world_human_smoking@male_c@idle_a","idle_b", -1, 30, 0)
            Wait(20000)
            Anim(ped, "amb_rest@world_human_smoking@male_c@base","base", -1, 30, 0)
            Wait(100)
        end
    end)

    throwPrompt:setOnControlJustPressed(function(group, prompt)
        ClearPedSecondaryTask(ped)
        if IsPedMale(ped) then
            Anim(ped, "amb_rest@world_human_smoking@male_a@stand_exit", "exit_back", -1, 1)
        else 
            Anim(ped, "amb_rest@world_human_smoking@female_b@trans", "b_trans_fire_stand_a", -1, 1)
        end
        Wait(3500)
        DetachEntity(cigarette, true, true)
        SetEntityVelocity(cigarette, 0.0,0.0,-1.0)
        Wait(1500)
        ClearPedSecondaryTask(ped)
        ClearPedTasks(ped)
        Wait(10)
        UipromptManager:removeGroup(promptGroup)
    end)
    
    UipromptManager:startEventThread()    
    if IsPedMale(ped) then
        AttachEntityToEntity(cigarette, ped, mouth, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        Anim(ped,"amb_rest@world_human_smoking@male_c@stand_enter","enter_back_rf",9400,0)
        Wait(1000)
        AttachEntityToEntity(cigarette, ped, righthand, 0.03, -0.01, 0.0, 0.0, 90.0, 0.0, true, true, false, true, 1, true)
        Wait(1000)
        AttachEntityToEntity(cigarette, ped, mouth, -0.017, 0.1, -0.01, 0.0, 90.0, -90.0, true, true, false, true, 1, true)
        Wait(3000)
        AttachEntityToEntity(cigarette, ped, righthand, 0.017, -0.01, -0.01, 0.0, 120.0, 10.0, true, true, false, true, 1, true)
        Wait(1000)
        Anim(ped,"amb_rest@world_human_smoking@male_c@base","base",-1,30)
        RemoveAnimDict("amb_rest@world_human_smoking@male_c@stand_enter")
        Wait(1000)
    else
        AttachEntityToEntity(cigarette, ped, mouth, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        Anim(ped,"amb_rest@world_human_smoking@female_c@base","base",-1,30)
        Wait(1000)
        AttachEntityToEntity(cigarette, ped, righthand, 0.01, 0.0, 0.01, 0.0, -160.0, -130.0, true, true, false, true, 1, true)
        Wait(2500)
    end

end

function Joint(high, hightype, highduration) 
    local ped = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(ped, true))

    local cigarette = CreateObject(GetHashKey('P_CIGARETTE01X'), x, y, z + 0.2, true, true, true)
    local righthand = GetEntityBoneIndexByName(ped, "SKEL_R_Finger13")
    local mouth = GetEntityBoneIndexByName(ped, "skel_head")

    local promptGroup = UipromptGroup:new(Config.Texts.Joint)
    local smokePrompt = Uiprompt:new("INPUT_DYNAMIC_SCENARIO", Config.Texts.Smoke, promptGroup)
    smokePrompt:setHoldMode(true)
    local throwPrompt = Uiprompt:new("INPUT_CONTEXT_B", Config.Texts.PutOut, promptGroup)



    smokePrompt:setOnHoldModeJustCompleted(function(group, prompt)
        if not IsEntityPlayingAnim(ped, "amb_rest@world_human_smoking@male_c@stand_enter", "enter_back_rf") then
            Anim(ped, "amb_rest@world_human_smoking@male_c@idle_a","idle_b", -1, 30, 0)
            Wait(20000)
            Anim(ped, "amb_rest@world_human_smoking@male_c@base","base", -1, 30, 0)
            Wait(100)
        end
            if high then
            HighEffect(hightype, highduration)
            end
    end)

    throwPrompt:setOnControlJustPressed(function(group, prompt)
        ClearPedSecondaryTask(ped)
        if IsPedMale(ped) then
            Anim(ped, "amb_rest@world_human_smoking@male_a@stand_exit", "exit_back", -1, 1)
        else 
            Anim(ped, "amb_rest@world_human_smoking@female_b@trans", "b_trans_fire_stand_a", -1, 1)
        end
        Wait(3500)
        DetachEntity(cigarette, true, true)
        SetEntityVelocity(cigarette, 0.0,0.0,-1.0)
        Wait(1500)
        ClearPedSecondaryTask(ped)
        ClearPedTasks(ped)
        Wait(10)
        UipromptManager:removeGroup(promptGroup)
    end)

    UipromptManager:startEventThread()    
    if IsPedMale(ped) then
        AttachEntityToEntity(cigarette, ped, mouth, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        Anim(ped,"amb_rest@world_human_smoking@male_c@stand_enter","enter_back_rf",9400,0)
        Wait(1000)
        AttachEntityToEntity(cigarette, ped, righthand, 0.03, -0.01, 0.0, 0.0, 90.0, 0.0, true, true, false, true, 1, true)
        Wait(1000)
        AttachEntityToEntity(cigarette, ped, mouth, -0.017, 0.1, -0.01, 0.0, 90.0, -90.0, true, true, false, true, 1, true)
        Wait(3000)
        AttachEntityToEntity(cigarette, ped, righthand, 0.017, -0.01, -0.01, 0.0, 120.0, 10.0, true, true, false, true, 1, true)
        Wait(1000)
        Anim(ped,"amb_rest@world_human_smoking@male_c@base","base",-1,30)
        RemoveAnimDict("amb_rest@world_human_smoking@male_c@stand_enter")
        Wait(1000)
    else
        AttachEntityToEntity(cigarette, ped, mouth, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        Anim(ped,"amb_rest@world_human_smoking@female_c@base","base",-1,30)
        Wait(1000)
        AttachEntityToEntity(cigarette, ped, righthand, 0.01, 0.0, 0.01, 0.0, -160.0, -130.0, true, true, false, true, 1, true)
        Wait(2500)
    end

end

function Cigar(high) 
    local prop_name = 'P_CIGAR01X'
    local ped = PlayerPedId()

    --Anim(ped,"amb_misc@world_human_chew_tobacco@male_a@stand_enter","enter_back",-1,30)
    --Wait(3500)
    --ClearPedTasks(ped)

    local dict = 'amb_rest@world_human_smoke_cigar@male_a@idle_b'
    local anim = 'idle_d'
    local x,y,z = table.unpack(GetEntityCoords(ped, true))
    local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetEntityBoneIndexByName(ped, 'SKEL_R_Finger12')

    local promptGroup = UipromptGroup:new(Config.Texts.Cigar)
    local smokePrompt = Uiprompt:new("INPUT_DYNAMIC_SCENARIO", Config.Texts.Smoke, promptGroup)
    smokePrompt:setHoldMode(true)
    local throwPrompt = Uiprompt:new("INPUT_CONTEXT_B", Config.Texts.PutOut, promptGroup)

    smokePrompt:setOnHoldModeJustCompleted(function(group, prompt)
            Anim(ped, "amb_rest@world_human_smoke_cigar@male_a@idle_b","idle_e", -1, 30, 0)
            Wait(7000)
            ClearPedTasks(ped)
            if high then
            playMoonshineEffect(hightype, highduration)
            end
    end)

    throwPrompt:setOnControlJustPressed(function(group, prompt)
        Anim(ped,"mech_inventory@item@_templates@cylinder@d6-5_h1-5_inspectz@unarmed@base","cylinder_put_away_satchel",-1,30)
        Citizen.Wait(1500)
        ClearPedSecondaryTask(ped)
        ClearPedTasks(ped)
        DeleteObject(prop)
        RemoveAnimDict(dict)
        UipromptManager:removeGroup(promptGroup)
    end)
    
    UipromptManager:startEventThread()   

    Wait(100)
    AttachEntityToEntity(prop, ped,boneIndex, 0.01, -0.00500, 0.01550, 0.024, 300.0, -40.0, true, true, false, true, 1, true)
    --TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
    Wait(1000)


end

function Pipe() 
    local ped = PlayerPedId()

    --Anim(ped,"amb_misc@world_human_chew_tobacco@male_a@stand_enter","enter_back",-1,30)
    --Wait(3500)
    --ClearPedTasks(ped)

    local male = IsPedMale(ped)
    local x,y,z = table.unpack(GetEntityCoords(ped, true))
    local pipe = CreateObject(GetHashKey('P_PIPE01X'), x, y, z + 0.2, true, true, true)
    local righthand = GetEntityBoneIndexByName(ped, "SKEL_R_Finger13")

    local promptGroup = UipromptGroup:new(Config.Texts.Pipe)
    local smokePrompt = Uiprompt:new("INPUT_DYNAMIC_SCENARIO", Config.Texts.Smoke, promptGroup)
    smokePrompt:setHoldMode(true)
    local throwPrompt = Uiprompt:new("INPUT_CONTEXT_B", Config.Texts.PutOut, promptGroup)

    smokePrompt:setOnHoldModeJustCompleted(function(group, prompt)
        if not IsEntityPlayingAnim(ped, "amb_rest@world_human_smoking@male_b@idle_c", "idle_g") then
            Anim(ped, "amb_rest@world_human_smoking@male_b@idle_a","idle_a", -1, 30, 0)
            Wait(22600)
            Anim(ped, "amb_rest@world_human_smoking@male_b@base","base", -1, 31, 0)
            Wait(100)
        end
    end)

    throwPrompt:setOnControlJustPressed(function(group, prompt)
        ClearPedSecondaryTask(ped)
        Anim(ped, "amb_wander@code_human_smoking_wander@male_b@trans", "pipe_trans_nopipe", -1, 30)
        Wait(6000)
        DeleteEntity(pipe)
        ClearPedSecondaryTask(ped)
        ClearPedTasks(ped)
        UipromptManager:removeGroup(promptGroup)
    end)

    
    AttachEntityToEntity(pipe, ped, righthand, 0.005, -0.045, 0.0, -170.0, 10.0, -15.0, true, true, false, true, 1, true)
    Anim(ped,"amb_wander@code_human_smoking_wander@male_b@trans","nopipe_trans_pipe",-1,30)
    Wait(9000)
    Anim(ped,"amb_rest@world_human_smoking@male_b@base","base",-1,31)
    
    while not IsEntityPlayingAnim(ped,"amb_rest@world_human_smoking@male_b@base","base", 3) do
        Wait(100)
    end

    UipromptManager:startEventThread()   
end


function Anim(actor, dict, body, duration, flags, introtiming, exittiming)
    Citizen.CreateThread(function()
        RequestAnimDict(dict)
        local dur = duration or -1
        local flag = flags or 1
        local intro = tonumber(introtiming) or 1.0
        local exit = tonumber(exittiming) or 1.0
        timeout = 5
        while (not HasAnimDictLoaded(dict) and timeout>0) do
            timeout = timeout-1
            if timeout == 0 then 
                print("Animation Failed to Load")
            end
            Citizen.Wait(300)
        end
        TaskPlayAnim(actor, dict, body, intro, exit, dur, flag --[[1 for repeat--]], 1, false, false, false, 0, true)
    end)
end

function HighEffect(hightype, highduration) 

    AnimpostfxPlay(hightype)

    Citizen.Wait(highduration * 1000)

	AnimpostfxStop(hightype)

end