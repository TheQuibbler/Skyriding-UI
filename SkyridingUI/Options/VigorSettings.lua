local addonName, _ = ...
local SkyridingUI = LibStub("AceAddon-3.0"):GetAddon(addonName)

--------------------------------------------------
-- Vigor Settings
--------------------------------------------------
function SkyridingUI:VigorSettings()
    return {
        type = "group",
        name = "Vigor",
        inline = true,
        order = 1,
        args = {
            vigor = {
                type = "toggle",
                name = "Enable",
                desc = "Enable or disable the Vigor module",
                order = 1,
                width = 1,
                get = function()
                    return SkyridingUI.db.profile.modules.vigor.enableVigor
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.vigor.enableVigor = value
                    SkyridingUI:UpdateModules()
                end,
            },
            colorVigor = {
                type = "color",
                name = "Vigor Color",
                desc = "Set the color of the Vigor \n\n!!This is not a true color, it will be multiplied with the texture's colors, so setting it to white will show the texture's true colors, while setting it to red will tint the texture red",
                order = 2,
                width = 1,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.vigor.enableVigor
                end,
                get = function()
                    local color = SkyridingUI.db.profile.modules.vigor.colorVigor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    SkyridingUI.db.profile.modules.vigor.colorVigor = { r = r, g = g, b = b, a = a }
                    SkyridingUI:UpdateModules()
                end,
            },
            colorBorderVigor = {
                type = "color",
                name = "Vigor Border Color",
                desc = "Set the color of the Vigor Border \n\n!!This is not a true color, it will be multiplied with the texture's colors, so setting it to white will show the texture's true colors, while setting it to red will tint the texture red",
                order = 3,
                width = 1,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.vigor.enableVigor
                end,
                get = function()
                    local color = SkyridingUI.db.profile.modules.vigor.colorBorderVigor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    SkyridingUI.db.profile.modules.vigor.colorBorderVigor = { r = r, g = g, b = b, a = a }
                    SkyridingUI:UpdateModules()
                end,
            },
            space1 = {
                type = "description",
                name = "",
                order = 3.5,
                width = "full",
            },
            showDecor = {
                type = "toggle",
                name = "Show Decor",
                desc = "Show or hide the left and right decor textures",
                order = 4,
                width = 1,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.vigor.enableVigor
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.vigor.showVigorDecor
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.vigor.showVigorDecor = value
                    SkyridingUI:UpdateModules()
                end,
            },
            colorVigorDecor = {
                type = "color",
                name = "Decor Color",
                desc = "Set the color of the Vigor Decor textures \n\n!!This is not a true color, it will be multiplied with the texture's colors, so setting it to white will show the texture's true colors, while setting it to red will tint the texture red",
                order = 5,
                width = 1,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.vigor.enableVigor
                end,
                get = function()
                    local color = SkyridingUI.db.profile.modules.vigor.colorVigorDecor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    SkyridingUI.db.profile.modules.vigor.colorVigorDecor = { r = r, g = g, b = b, a = a }
                    SkyridingUI:UpdateModules()
                end,
            },
        },
    }
end