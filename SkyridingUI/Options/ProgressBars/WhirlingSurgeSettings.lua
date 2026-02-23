local addonName, _ = ...
local SkyridingUI = LibStub("AceAddon-3.0"):GetAddon(addonName)

--------------------------------------------------
-- Whirling Surge Settings
--------------------------------------------------
function SkyridingUI:WhirlingSurgeSettings()
    return {
        type = "group",
        name = "Whirling Surge Bar",
        inline = true,
        order = 3,
        args = {
            enableWhirlingSurge = {
                type = "toggle",
                name = "Enable",
                desc = "Enable or disable the Whirling Surge progress bar",
                order = 1,
                width = 0.65,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.enableWhirlingSurge
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.enableWhirlingSurge = value
                    SkyridingUI:UpdateModules()
                end,
            },
            widthWhirlingSurge = {
                type = "range",
                name = "Width",
                desc = "Whirling Surge bar width in pixels",
                order = 2,
                width = 1,
                min = 100,
                max = 300,
                step = 1,
                hidden = function()
                    return SkyridingUI.db.profile.modules.optional.useSharedSizeProgressBar
                        or not SkyridingUI.db.profile.modules.optional.enableWhirlingSurge
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.widthWhirlingSurge
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.widthWhirlingSurge = value
                    SkyridingUI:UpdateModules()
                end,
            },
            heightWhirlingSurge = {
                type = "range",
                name = "Height",
                desc = "Whirling Surge bar height in pixels",
                order = 3,
                width = 1,
                min = 15,
                max = 50,
                step = 1,
                hidden = function()
                    return SkyridingUI.db.profile.modules.optional.useSharedSizeProgressBar
                        or not SkyridingUI.db.profile.modules.optional.enableWhirlingSurge
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.heightWhirlingSurge
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.heightWhirlingSurge = value
                    SkyridingUI:UpdateModules()
                end,
            },
            space1 = {                  
                type = "description",
                name = "",
                order = 3.5,
                width = 0.25,
            },  
            colorWhirlingSurge = {
                type = "color",
                name = "Bar Color",
                desc = "Color of the Whirling Surge progress bar",
                order = 4,
                width = 0.8,
                hasAlpha = true,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableWhirlingSurge
                end,
                get = function()
                    local c = SkyridingUI.db.profile.modules.optional.colorWhirlingSurge
                    return c.r, c.g, c.b, c.a
                end,
                set = function(_, r, g, b, a)
                    SkyridingUI.db.profile.modules.optional.colorWhirlingSurge = { r = r, g = g, b = b, a = a }
                    SkyridingUI:UpdateModules()
                end,
            },
            colorBorderWhirlingSurge = {
                type = "color",
                name = "Border Color",
                desc = "Color of the border of the Whirling Surge bar",
                order = 5,
                width = 1,
                hasAlpha = true,
                hidden = function()
                    return SkyridingUI.db.profile.modules.optional.useSharedBorderColorProgressBar
                        or not SkyridingUI.db.profile.modules.optional.enableWhirlingSurge
                end,
                get = function()
                    local c = SkyridingUI.db.profile.modules.optional.colorBorderWhirlingSurge
                    return c.r, c.g, c.b, c.a
                end,
                set = function(_, r, g, b, a)
                    SkyridingUI.db.profile.modules.optional.colorBorderWhirlingSurge = { r = r, g = g, b = b, a = a }
                    SkyridingUI:UpdateModules()
                end,
            },
            space2 = {
                type = "description",
                name = "",
                order = 5.5,
                width = "full",
            },
            previewWhirlingSurge = {
                type = "toggle",
                name = "Preview Animation",
                desc = "Preview the Whirling Surge progress bar without needing the spell to be used",
                order = 6,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableWhirlingSurge
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.previewWhirlingSurge
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.previewWhirlingSurge = value
                    SkyridingUI:UpdateModules()
                end,
            },
        },
    }
end