-- Hello, I've commented out the whole script because I don't think it's good enough. 
-- I mean, if you want to use it, go ahead — but it's mainly for RP servers. 
-- I just don't think it's realistic.

-- local cam = nil
-- local isPeeking = false
-- local peekDirection = nil
-- local currentOffsetX = 0.0
-- local targetOffsetX = 0.0
-- local currentYawOffset = 0.0
-- local targetYawOffset = 0.0
-- local smoothing = 0.15
-- local MAX_OFFSET_X = 0.35
-- local MAX_YAW_ANGLE = 8.0

-- local function CreatePeekCam(ped, direction)
--     if cam then
--         DestroyCam(cam, false)
--     end

--     cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
--     currentOffsetX = 0.0
--     targetOffsetX = (direction == "left") and -MAX_OFFSET_X or MAX_OFFSET_X

--     currentYawOffset = 0.0
--     targetYawOffset = (direction == "left") and -MAX_YAW_ANGLE or MAX_YAW_ANGLE

--     AttachCamToEntity(cam, ped, currentOffsetX, -0.2, 0.6, true)
--     local heading = GetEntityHeading(ped)
--     SetCamRot(cam, -15.0, 0.0, heading + currentYawOffset)

--     SetCamActive(cam, true)
--     RenderScriptCams(true, true, 300, true, false)

--     isPeeking = true
--     peekDirection = direction
-- end

-- local function DestroyPeekCam()
--     if cam then
--         RenderScriptCams(false, true, 300, true, false)
--         DestroyCam(cam, false)
--         cam = nil
--     end
--     isPeeking = false
--     peekDirection = nil
--     currentOffsetX = 0.0
--     targetOffsetX = 0.0
--     currentYawOffset = 0.0
--     targetYawOffset = 0.0
-- end

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)
--         local ped = PlayerPedId()
--         local playerId = PlayerId()

--         if IsPlayerFreeAiming(playerId) then
--             if not isPeeking then
--                 if IsControlPressed(0, 44) then
--                     CreatePeekCam(ped, "left")
--                 elseif IsControlPressed(0, 38) then
--                     CreatePeekCam(ped, "right")
--                 end
--             else
--                 if (peekDirection == "left" and not IsControlPressed(0, 44)) or
--                    (peekDirection == "right" and not IsControlPressed(0, 38)) then
--                     DestroyPeekCam()
--                 end
--             end
--         elseif isPeeking then
--             DestroyPeekCam()
--         end

--         if isPeeking and cam then
--             currentOffsetX = currentOffsetX + (targetOffsetX - currentOffsetX) * smoothing
--             currentYawOffset = currentYawOffset + (targetYawOffset - currentYawOffset) * smoothing
--             local offsetY, offsetZ = -0.2, 0.6
--             AttachCamToEntity(cam, ped, currentOffsetX, offsetY, offsetZ, true)
--             local camRot = GetGameplayCamRot(2)
--             SetCamRot(cam, camRot.x, 0.0, camRot.z + currentYawOffset)
--         end
--     end
-- end)

-- CreateThread(function()
--     SetPlayerCanUseCover(PlayerId(), false)
-- end)