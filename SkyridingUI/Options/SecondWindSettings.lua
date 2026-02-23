local addonName, _ = ...
local SkyridingUI = LibStub("AceAddon-3.0"):GetAddon(addonName)

--------------------------------------------------
-- Second Wind Settings
--------------------------------------------------
function SkyridingUI:SecondWindSettings()
    return {
        type = "group",
        name = "Second Wind",
        inline = true,
        order = 2,
        args = {
            enableSecondWind = {
                type = "toggle",
                name = "Enable",
                desc = "Enable or disable the Second Wind module",
                order = 1,
                width = 1,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.enableSecondWind
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.enableSecondWind = value
                    SkyridingUI:UpdateModules()
                end,
            },
            colorSecondWind = {
                type = "color",
                name = "Second Wind Color",
                desc = "Set the color of the Second Wind \n\n!!This is not a true color, it will be multiplied with the texture's colors, so setting it to white will show the texture's true colors, while setting it to red will tint the texture red",
                order = 2,
                width = 1,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSecondWind
                end,
                get = function()
                    local color = SkyridingUI.db.profile.modules.optional.colorSecondWind
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    SkyridingUI.db.profile.modules.optional.colorSecondWind = { r = r, g = g, b = b, a = a }
                    SkyridingUI:UpdateModules()
                end,
            },
            colorBorderSecondWind = {
                type = "color",
                name = "Second Wind Border Color",
                desc = "Set the color of the Second Wind Border \n\n!!This is not a true color, it will be multiplied with the texture's colors, so setting it to white will show the texture's true colors, while setting it to red will tint the texture red",
                order = 3,
                width = 1.2,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSecondWind
                end,
                get = function()
                    local color = SkyridingUI.db.profile.modules.optional.colorBorderSecondWind
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    SkyridingUI.db.profile.modules.optional.colorBorderSecondWind = { r = r, g = g, b = b, a = a }
                    SkyridingUI:UpdateModules()
                end,
            },
            space1 = {
                type = "description",
                name = "",
                order = 3.5,
                width = "full",
            },
            frameStyleSecondWind = {
                type = "select",
                name = "Atlas Style",
                desc = "Choose the atlas texture for the Second Wind border.",
                order = 4,
                width = 1,
                values = {
                    gold = "Gold",
                    dark = "Dark",
                    silver = "Silver",
                    bronze = "Bronze",
                },
                sorting = { "gold", "dark", "silver", "bronze" },
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSecondWind
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.frameStyleSecondWind
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.frameStyleSecondWind = value
                    SkyridingUI:UpdateModules()
                end,
            },
        },
    }
end