local addonName, _ = ...
local SkyridingUI = LibStub("AceAddon-3.0"):GetAddon(addonName)

--------------------------------------------------
-- Progress Bars Shared Settings
--------------------------------------------------
function SkyridingUI:ProgressBarSharedSettings()
    return {
        type = "group",
        name = "Shared Settings",
        inline = true,
        order = 1,
        args = {
            useSharedSizeProgressBar = {
                type = "toggle",
                name = "Use Shared Size",
                desc = "Apply a single width and height to all progress bars in this group.",
                order = 1,
                width = 1,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                       and not SkyridingUI.db.profile.modules.optional.enableWhirlingSurge
                       and not SkyridingUI.db.profile.modules.optional.enableSkywardAscent
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.useSharedSizeProgressBar
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.useSharedSizeProgressBar = value
                    SkyridingUI:UpdateModules()
                end,
            },
            sharedWidthProgressBar = {
                type = "range",
                name = "Shared Width",
                desc = "Width applied to all progress bars when shared size is enabled.",
                order = 2,
                width = 1,
                min = 100,
                max = 300,
                step = 1,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.useSharedSizeProgressBar
                       or (not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                       and not SkyridingUI.db.profile.modules.optional.enableWhirlingSurge
                       and not SkyridingUI.db.profile.modules.optional.enableSkywardAscent)
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.sharedWidthProgressBar
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.sharedWidthProgressBar = value
                    SkyridingUI:UpdateModules()
                end,
            },
            sharedHeightProgressBar = {
                type = "range",
                name = "Shared Height",
                desc = "Height applied to all progress bars when shared size is enabled.",
                order = 3,
                width = 1,
                min = 15,
                max = 50,
                step = 1,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.useSharedSizeProgressBar
                       or (not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                       and not SkyridingUI.db.profile.modules.optional.enableWhirlingSurge
                       and not SkyridingUI.db.profile.modules.optional.enableSkywardAscent)
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.sharedHeightProgressBar
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.sharedHeightProgressBar = value
                    SkyridingUI:UpdateModules()
                end,
            },
            spacer1 = {
                type = "description",
                name = "",
                order = 3.5,
                width = "full",
            },
            useSharedBorderColorProgressBar = {
                type = "toggle",
                name = "Use Shared Border Color",
                desc = "Apply one border color to all progress bars in this group.",
                order = 4,
                width = 1.3,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                       and not SkyridingUI.db.profile.modules.optional.enableWhirlingSurge
                       and not SkyridingUI.db.profile.modules.optional.enableSkywardAscent
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.useSharedBorderColorProgressBar
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.useSharedBorderColorProgressBar = value
                    SkyridingUI:UpdateModules()
                end,
            },
            sharedBorderColorProgressBar = {
                type = "color",
                name = "Shared Border Color",
                desc = "Border color applied to all progress bars when shared color is enabled.",
                order = 5,
                width = 1,
                hasAlpha = true,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.useSharedBorderColorProgressBar
                       or (not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                       and not SkyridingUI.db.profile.modules.optional.enableWhirlingSurge
                       and not SkyridingUI.db.profile.modules.optional.enableSkywardAscent)
                end,
                get = function()
                    local c = SkyridingUI.db.profile.modules.optional.sharedBorderColorProgressBar
                    return c.r, c.g, c.b, c.a
                end,
                set = function(_, r, g, b, a)
                    SkyridingUI.db.profile.modules.optional.sharedBorderColorProgressBar = { r = r, g = g, b = b, a = a }
                    SkyridingUI:UpdateModules()
                end,
            },
            spacer2 = {
                type = "description",
                name = "",
                order = 5.5,
                width = "full",
            },
            previewProgressBars = {
                type = "toggle",
                name = "Preview All Progress Bars",
                desc = "Toggle preview mode for every progress bar at once.",
                order = 6,
                width = 1.2,
                hidden = function()
                    return not SkyridingUI.db.profile.modules.optional.enableSpeedBar 
                       and not SkyridingUI.db.profile.modules.optional.enableWhirlingSurge
                       and not SkyridingUI.db.profile.modules.optional.enableSkywardAscent
                end,
                get = function()
                    return SkyridingUI.db.profile.modules.optional.previewProgressBars
                        and SkyridingUI.db.profile.modules.optional.previewSpeedBar
                        and SkyridingUI.db.profile.modules.optional.previewWhirlingSurge
                        and SkyridingUI.db.profile.modules.optional.previewSkywardAscent
                end,
                set = function(_, value)
                    SkyridingUI.db.profile.modules.optional.previewProgressBars = value
                    SkyridingUI.db.profile.modules.optional.previewSpeedBar = value
                    SkyridingUI.db.profile.modules.optional.previewWhirlingSurge = value
                    SkyridingUI.db.profile.modules.optional.previewSkywardAscent = value
                    SkyridingUI:UpdateModules()
                end,
            },
        },
    }
end