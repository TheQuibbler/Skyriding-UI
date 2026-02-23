local addonName, _ = ...
local SkyridingUI = LibStub("AceAddon-3.0"):GetAddon(addonName)

--------------------------------------------------
-- Ground Skimming Settings
--------------------------------------------------
function SkyridingUI:GroundSkimmingSettings()
    return {
        type = "group",
        name = "Ground Skimming",
        inline = true,
        order = 3,
        args = {
            enableGroundSkimming = {
                type = "toggle",
                name = "Enable",
                desc = "Enable or disable the Ground Skimming module",
                order = 1,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.enableGroundSkimming
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.enableGroundSkimming = value
                    SkyridingUI:UpdateModules()
                end,
            },
            colorGroundSkimming = {
                type = "color",
                name = "Texture Color",
                desc = "Change the color of the Ground Skimming textures",
                order = 2,
                hasAlpha = true,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableGroundSkimming
                end,
                get = function()
                    local c = SkyridingUI.db.profile.modules.optional.colorGroundSkimming
                    return c.r, c.g, c.b, c.a
                end,
                set = function(_, r, g, b, a)
                    SkyridingUI.db.profile.modules.optional.colorGroundSkimming = { r = r, g = g, b = b, a = a }
                    SkyridingUI:UpdateModules()
                end,
            },
            space1 = {
                type = "description",
                name = "",
                order = 2.5,
                width = "full",
            },
            previewGroundSkimming = {
                type = "toggle",
                name = "Preview Animation",
                desc = "Preview the Ground Skimming textures and animation without needing the buff",
                order = 3,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableGroundSkimming
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.previewGroundSkimming
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.previewGroundSkimming = value
                    SkyridingUI:UpdateModules()
                end,
            },
        },
    }
end