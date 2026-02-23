local addonName, _ = ...
local SkyridingUI = LibStub("AceAddon-3.0"):GetAddon(addonName)

--------------------------------------------------
-- Speed Bar Settings
--------------------------------------------------
function SkyridingUI:SpeedBarSettings()
    return {
        type = "group",
        name = "Speed Bar",
        inline = true,
        order = 2,
        args = {
            enableSpeedBar = {
                type = "toggle",
                name = "Enable",
                desc = "Enable or disable the Speed Bar module",
                order = 1,
                width = 0.65,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.enableSpeedBar
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.enableSpeedBar = value
                    SkyridingUI:UpdateModules()
                end,
            },
            widthSpeedBar = {
                type = "range",
                name = "Width",
                desc = "Speed bar width in pixels",
                order = 2,
                width = 1,
                min = 100,
                max = 300,
                step = 1,
                hidden = function()
                    return SkyridingUI.db.profile.modules.optional.useSharedSizeProgressBar
                        or not SkyridingUI.db.profile.modules.optional.enableSpeedBar
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.widthSpeedBar
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.widthSpeedBar = value
                    SkyridingUI:UpdateModules()
                end,
            },
            heightSpeedBar = {
                type = "range",
                name = "Height",
                desc = "Speed bar height in pixels",
                order = 3,
                width = 1,
                min = 20,
                max = 50,
                step = 1,
                hidden = function()
                    return SkyridingUI.db.profile.modules.optional.useSharedSizeProgressBar
                        or not SkyridingUI.db.profile.modules.optional.enableSpeedBar
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.heightSpeedBar
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.heightSpeedBar = value
                    SkyridingUI:UpdateModules()
                end,
            },
            space1 = {
                type = "description",
                name = "",
                order = 3.5,
                width = 0.25,
            },
            colorSpeedBar = {
                type = "color",
                name = "Bar Color",
                desc = "Color of the filled portion of the speed bar",
                order = 4,
                width = 0.8,
                hasAlpha = true,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                end,
                get = function()
                    local c = SkyridingUI.db.profile.modules.optional.colorSpeedBar
                    return c.r, c.g, c.b, c.a
                end,
                set = function(_, r, g, b, a)
                    SkyridingUI.db.profile.modules.optional.colorSpeedBar = { r = r, g = g, b = b, a = a }
                    SkyridingUI:UpdateModules()
                end,
            },
            colorBorderSpeedBar = {
                type = "color",
                name = "Border Color",
                desc = "Color of the border of the speed bar",
                order = 5,
                width = 1,
                hasAlpha = true,
                hidden = function()
                    return SkyridingUI.db.profile.modules.optional.useSharedBorderColorProgressBar
                        or not SkyridingUI.db.profile.modules.optional.enableSpeedBar
                end,
                get = function()
                    local c = SkyridingUI.db.profile.modules.optional.colorBorderSpeedBar
                    return c.r, c.g, c.b, c.a
                end,
                set = function(_, r, g, b, a)
                    SkyridingUI.db.profile.modules.optional.colorBorderSpeedBar = { r = r, g = g, b = b, a = a }
                    SkyridingUI:UpdateModules()
                end,
            },

            space2 = {
                type = "description",
                name = "",
                order = 5.5,
                width = "full",
            },
            previewSpeedBar = {
                type = "toggle",
                name = "Preview Animation",
                desc = "Preview the speed bar with sample data to see how your settings look",
                order = 6,
                width = 1,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.previewSpeedBar
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.previewSpeedBar = value
                    SkyridingUI:UpdateModules()
                end,
            },
            space3 = {
                type = "description",
                name = "",
                order = 6.5,
                width = "full",
            },
            enableTextSpeedBar = {
                type = "toggle",
                name = "Show Text",
                desc = "Show numeric speed on the bar",
                order = 7,
                width = 0.8, 
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.enableTextSpeedBar
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.enableTextSpeedBar = value
                    SkyridingUI:UpdateModules()
                end,
            },
            textLocationSpeedBar = {
                type = "select",
                name = "Text Location",
                desc = "Choose the location of the speed text on the bar",
                order = 8,
                width = 0.8,
                values = {
                    left = "Left",
                    center = "Center",
                    right = "Right",
                },
                sorting = {"Left", "Center", "Right"},
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.textLocationSpeedBar
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.textLocationSpeedBar = value
                    SkyridingUI:UpdateModules()
                end,
            },
            space4 = {
                type = "description",
                name = "",
                order = 8.5,
                width = 0.3,
            },
            textColorSpeedBar = {
                type = "color",
                name = "Text Color",
                desc = "Color of the speed text on the bar",
                order = 9,
                width = 1,
                hasAlpha = true,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                end,
                get = function()
                    local c = SkyridingUI.db.profile.modules.optional.textColorSpeedBar
                    return c.r, c.g, c.b, c.a
                end,
                set = function(_, r, g, b, a)
                    SkyridingUI.db.profile.modules.optional.textColorSpeedBar = { r = r, g = g, b = b, a = a }
                    SkyridingUI:UpdateModules()
                end,
            },
            space6 = {
                type = "description",
                name = "",
                order = 9.5,
                width = "full",
            },
            enableUnitSpeedBar = {
                type = "toggle",
                name = "Show Unit",
                desc = "Show unit (%, yd/s, or m/s) with the speed text on the bar",
                order = 10,
                width = 0.8, 
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.enableUnitSpeedBar
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.enableUnitSpeedBar = value
                    SkyridingUI:UpdateModules()
                end,
            },
            unitSpeedBar = {
                type = "select",
                name = "Display Units",
                desc = "Choose units to display on the speed text",
                order = 11,
                width = 0.8,
                values = {
                    percent = "Percent",
                    yds = "yd/s",
                    ms = "m/s",
                },
                sorting = {"percent", "yds", "ms"},
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.unitSpeedBar
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.unitSpeedBar = value
                    SkyridingUI:UpdateModules()
                end,
            },
            space7 = {
                type = "description",
                name = "",
                order = 11.5,
                width = "full",
            },
            thrillMarkerSpeedBar = {
                type = "toggle",
                name = "Show Thrill Marker",
                desc = "Show marker on bar when Thrill of the Skies is active",
                order = 12,
                width = 1.02,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.thrillMarkerSpeedBar
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.thrillMarkerSpeedBar = value
                    SkyridingUI:UpdateModules()
                end,
            },
            thrillMarkerColorSpeedBar = {
                type = "color",
                name = "Thrill Marker Color",
                desc = "Color of the thrill of the skies speed marker on the speed bar",
                order = 13,
                width = 1,
                hasAlpha = true,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                end,
                get = function()
                    local c = SkyridingUI.db.profile.modules.optional.thrillMarkerColorSpeedBar
                    return c.r, c.g, c.b, c.a
                end,
                set = function(_, r, g, b, a)
                    SkyridingUI.db.profile.modules.optional.thrillMarkerColorSpeedBar = { r = r, g = g, b = b, a = a }
                    SkyridingUI:UpdateModules()
                end,
            },
            
        },
    }
end