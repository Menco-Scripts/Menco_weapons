Citizen.CreateThread(function()
    local n3d = CreateNui3d("utility_lib_1", "html/ui.html")

    while true do
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local camView = GetFollowPedCamViewMode()
        local isFirstPerson = (camView == 4)

        if IsPedReloading(ped) then
            if n3d:visible() then
                n3d:hide()
            end
        else
            if IsControlPressed(0, 25) and IsPedArmed(ped, 4) then
                if not n3d:visible() then
                    n3d:show(coords)

                    local _, weaponHash = GetCurrentPedWeapon(ped)
                    local obj = GetClosestObjectOfType(coords, 2.0, GetWeapontypeModel(weaponHash))

                    if isFirstPerson then
                        n3d:attach(obj, vector3(0.7, -0.5, 0.3))
                    else
                        n3d:attach(obj, vector3(0.4, -0.3, 0.2))
                    end

                    n3d:rotation(90.0, true)

                    local _, weaponHash = GetCurrentPedWeapon(ped)
                    local _, ammo = GetAmmoInClip(ped, weaponHash)
                    local maxammo = GetAmmoInPedWeapon(ped, weaponHash)

                    n3d:msg({
                        ammo = ammo,
                        maxammo = maxammo - ammo
                    })
                else
                    local _, weaponHash = GetCurrentPedWeapon(ped)
                    local obj = GetClosestObjectOfType(coords, 2.0, GetWeapontypeModel(weaponHash))

                    if isFirstPerson then
                        n3d:attach(obj, vector3(1.3, 0.6, 0.1))
                    else
                        n3d:attach(obj, vector3(0.4, -0.3, 0.2))
                    end
                end

                if IsControlPressed(0, 24) then
                    local _, weaponHash = GetCurrentPedWeapon(ped)
                    local _, ammo = GetAmmoInClip(ped, weaponHash)
                    local maxammo = GetAmmoInPedWeapon(ped, weaponHash)

                    n3d:msg({
                        ammo = ammo,
                        maxammo = maxammo - ammo
                    })
                end
            else
                if n3d:visible() then
                    n3d:hide()
                end
            end
        end

        Citizen.Wait(5)
    end
end)
