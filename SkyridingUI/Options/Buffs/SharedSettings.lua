local addonName, _ = ...
local SkyridingUI = LibStub("AceAddon-3.0"):GetAddon(addonName)

--------------------------------------------------
-- Thrill of the Skies & Ground Skimming Shared Settings
--------------------------------------------------
function SkyridingUI:BuffSharedSettings()
    return {
        type = "group",
        name = "Shared Settings",
        inline = true,
        order = 1,
        args = {
            pulseType = {
                type = "select",
                name = "Pulse Type",
                desc = "Choose the animation type for Thrill of the Skies and Ground Skimming: Movement, Scale, or Alpha.",
                order = 1,
                width = 0.8,
                values = {
                    none   = "None",
                    movement = "Movement",
                    scale    = "Scale",
                    alpha    = "Alpha",
                },
                sorting = {"none", "movement", "scale", "alpha"},
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableThrillOfTheSkies 
                       and not SkyridingUI.db.profile.modules.optional.enableGroundSkimming
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.pulseType
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.pulseType = value
                    SkyridingUI:UpdateModules()
                end,
            },
            space1 = {
                type = "description",
                name = "",
                order = 1.5,
                width = 0.2,
            },
            pulseSpeed = {
                type = "range",
                name = "Pulse Speed",
                desc = "Adjust the pulse speed for both modules",
                order = 2,
                min = 0,
                max = 10,
                step = 0.1,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableThrillOfTheSkies 
                       and not SkyridingUI.db.profile.modules.optional.enableGroundSkimming
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.pulseSpeed
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.pulseSpeed = value
                    SkyridingUI:UpdateModules()
                end,
            },
            movementAmplitude = {
                type = "range",
                name = "Movement Amplitude",
                desc = "How far the frame moves during the pulse animation (0 = no movement, 5 = maximum movement).",
                order = 3,
                min = 0,
                max = 5,
                step = 1,
                hidden = function()
                    return SkyridingUI.db.profile.modules.optional.pulseType ~= "movement"
                       or (not SkyridingUI.db.profile.modules.optional.enableThrillOfTheSkies 
                       and not SkyridingUI.db.profile.modules.optional.enableGroundSkimming)
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.movementAmplitude
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.movementAmplitude = value
                    SkyridingUI:UpdateModules()
                end,
            },
            scaleMultiplier = {
                type = "range",
                name = "Scale Increase",
                desc = "How much larger the frame becomes during the pulse animation (1 = no change, 1.5 = 50% larger).",
                order = 4,
                min = 1.0,
                max = 1.5,
                step = 0.05,
                hidden = function()
                    return SkyridingUI.db.profile.modules.optional.pulseType ~= "scale"
                       or (not SkyridingUI.db.profile.modules.optional.enableThrillOfTheSkies 
                       and not SkyridingUI.db.profile.modules.optional.enableGroundSkimming)
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.scaleMultiplier
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.scaleMultiplier = value
                    SkyridingUI:UpdateModules()
                end,
            },
            alphaReduction = {
                type = "range",
                name = "Alpha Reduction",
                desc = "How much the frame fades during the pulse animation (0 = fully transparent, 1 = no fade).",
                order = 5,
                min = 0,
                max = 1,
                step = 0.05,
                hidden = function()
                    return SkyridingUI.db.profile.modules.optional.pulseType ~= "alpha"
                          or (not SkyridingUI.db.profile.modules.optional.enableThrillOfTheSkies 
                          and not SkyridingUI.db.profile.modules.optional.enableGroundSkimming)
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.alphaReduction
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.alphaReduction = value
                    SkyridingUI:UpdateModules()
                end,
            },
            space2 = {
                type = "description",
                name = "",
                order = 5.5,
                width = "full",
            },
            preview = {
                type = "toggle",
                name = "Preview Animation",
                desc = "Preview the pulse animation on both modules without needing the buffs",
                order = 6,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableThrillOfTheSkies 
                       and not SkyridingUI.db.profile.modules.optional.enableGroundSkimming
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.preview
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.preview = value
                    SkyridingUI:UpdateModules()
                end,
            },
        },
    }
end