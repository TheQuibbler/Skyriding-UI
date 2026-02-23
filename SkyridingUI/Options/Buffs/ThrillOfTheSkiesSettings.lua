local addonName, _ = ...
local SkyridingUI = LibStub("AceAddon-3.0"):GetAddon(addonName)

--------------------------------------------------
-- Thrill of the Skies Settings
--------------------------------------------------
function SkyridingUI:ThrillOfTheSkiesSettings()
    return {
        type = "group",
        name = "Thrill of the Skies",
        inline = true,
        order = 2,
        args = {
            enableThrillOfTheSkies = {
                type = "toggle",
                name = "Enable",
                desc = "Enable or disable the Thrill of the Skies module",
                order = 1,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.enableThrillOfTheSkies
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.enableThrillOfTheSkies = value
                    SkyridingUI:UpdateModules()
                end,
            },
            colorThrillOfTheSkies = {
                type = "color",
                name = "Texture Color",
                desc = "Change the color of the Thrill of the Skies textures",
                order = 2,
                hasAlpha = true,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableThrillOfTheSkies
                end,
                get = function()
                    local c = SkyridingUI.db.profile.modules.optional.colorThrillOfTheSkies
                    return c.r, c.g, c.b, c.a
                end,
                set = function(_, r, g, b, a)
                    SkyridingUI.db.profile.modules.optional.colorThrillOfTheSkies = { r = r, g = g, b = b, a = a }
                    SkyridingUI:UpdateModules()
                end,
            },
            space1 = {
                type = "description",
                name = "",
                order = 2.5,
                width = "full",
            },
            previewThrillOfTheSkies = {
                type = "toggle",
                name = "Preview Animation",
                desc = "Preview the Thrill of the Skies textures and animation without needing the buff",
                order = 3,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableThrillOfTheSkies
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.previewThrillOfTheSkies
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.previewThrillOfTheSkies = value
                    SkyridingUI:UpdateModules()
                end,
            },
        },
    }
end