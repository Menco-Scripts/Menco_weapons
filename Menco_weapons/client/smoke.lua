local allWeapons = {
    "WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_MICROSMG",
    "WEAPON_SMG",
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_CARBINERIFLE",
    "WEAPON_ADVANCEDRIFLE",
    "WEAPON_MG",
    "WEAPON_COMBATMG",
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_SAWNOFFSHOTGUN",
    "WEAPON_ASSAULTSHOTGUN",
    "WEAPON_BULLPUPSHOTGUN",
    "WEAPON_STUNGUN",
    "WEAPON_SNIPERRIFLE",
    "WEAPON_HEAVYSNIPER",
    "WEAPON_REMOTESNIPER",
    "WEAPON_GRENADELAUNCHER",
    "WEAPON_RPG",
    "WEAPON_GRENADE",
    "WEAPON_STICKYBOMB",
    "WEAPON_SMOKEGRENADE",
    "WEAPON_MOLOTOV",
    "WEAPON_FIREEXTINGUISHER",
    "WEAPON_PETROLCAN",
    "WEAPON_CARBINERIFLE_MK2",
    "WEAPON_COMBATPDW",
}

local weaponsConfig = {}

for _, weaponName in ipairs(allWeapons) do
    weaponsConfig[weaponName] = {
        flashDict = "core",
        flashFx = "muz_flash_assaultrifle",
        smokeDict = "core",
        smokeFx = "weapon_smoke",
    }
end

function loadPtfxDict(dict)
    if not HasNamedPtfxAssetLoaded(dict) then
        RequestNamedPtfxAsset(dict)
        while not HasNamedPtfxAssetLoaded(dict) do
            Wait(10)
        end
    end
end

CreateThread(function()
    while true do
        Wait(0)
        if IsPedShooting(PlayerPedId()) then
            local ped = PlayerPedId()
            local weapon = GetSelectedPedWeapon(ped)
            local weaponName = nil

            for name, _ in pairs(weaponsConfig) do
                if weapon == GetHashKey(name) then
                    weaponName = name
                    break
                end
            end

            if weaponName then
                local cfg = weaponsConfig[weaponName]
                local weaponEntity = GetCurrentPedWeaponEntityIndex(ped)

                loadPtfxDict(cfg.smokeDict)
                loadPtfxDict(cfg.flashDict)

                UseParticleFxAssetNextCall(cfg.flashDict)
                StartParticleFxNonLoopedOnEntity(
                    cfg.flashFx,
                    weaponEntity,
                    0.0, 0.15, 0.05,
                    0.0, 0.0, 0.0,
                    3.0,
                    false, false, false
                )

                UseParticleFxAssetNextCall(cfg.smokeDict)
                StartParticleFxNonLoopedOnEntity(
                    cfg.smokeFx,
                    weaponEntity,
                    0.0, 0.0, 0.1,
                    0.0, 0.0, 0.0,
                    1.3,
                    false, false, false
                )

                Wait(120)
            end
        end
    end
end)
