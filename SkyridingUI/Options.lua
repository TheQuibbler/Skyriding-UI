-- Get the main addon object from AceAddon-3.0
local addonName, _ = ...
local SkyridingUI = LibStub("AceAddon-3.0"):GetAddon(addonName)

--------------------------------------------------
-- Options Table
--------------------------------------------------
-- Define the options table for AceConfig
local OptionsTable = {
    type = "group",
    name = "Skyriding UI",
    args = {
        --------------------------------------------------
        --- GlobalUISettings
        --------------------------------------------------
        globalUISettings = SkyridingUI.GlobalUISettings(),

        --------------------------------------------------
        --- Vigor & Second Wind Settings
        --------------------------------------------------
        vigorAndSecondWindGroup = {
            type = "group",
            name = "Vigor & Second Wind",
            inline = false,
            order = 2,
            args = {
                vigorSettings = SkyridingUI:VigorSettings(),
                secondWindSettings = SkyridingUI:SecondWindSettings(),
            },
        },

        --------------------------------------------------
        --- Progress Bar Settings
        --------------------------------------------------
        progressBarGroup = {
            type = "group",
            name = "Speed Bar, Whirling Surge and Skyward Ascent",
            inline = false,
            order = 3,
            args = {
                sharedProgressBarSettings = SkyridingUI:ProgressBarSharedSettings(),
                speedBarSettings = SkyridingUI:SpeedBarSettings(),
                skywardAscentSettings = SkyridingUI:SkywardAscentSettings(),
                whirlingSurgeSettings = SkyridingUI:WhirlingSurgeSettings(),
            },
        },

        ------------------------------------------------
        --- Buff Settings
        --------------------------------------------------
        buffGroup = {
            type = "group",
            name = "Thrill of the Skies & Ground Skimming",
            inline = false,
            order = 4,
            args = {
                sharedBuffSettings = SkyridingUI:BuffSharedSettings(),
                thrillOfTheSkiesSettings = SkyridingUI:ThrillOfTheSkiesSettings(),
                groundSkimmingSettings = SkyridingUI:GroundSkimmingSettings(),
             },
        },

        --------------------------------------------------
        -- Debug
        --------------------------------------------------
        -- debug = {
        --     type = "toggle",
        --     name = "Enable Debug",
        --     order = 99,
        --     get = function()
        --         -- Get current debug state from profile
        --         return SkyridingUI.db.profile.debug
        --     end,
        --     set = function(_, value)
        --         -- Set debug state and print status
        --         SkyridingUI.db.profile.debug = value
        --         print("SkyridingUI Debug: " .. (value and "Enabled" or "Disabled"))
        --     end,
        -- },
    },
}

--------------------------------------------------
-- Register Options
--------------------------------------------------
-- Register the options table with AceConfig and add it to the Blizzard options UI
LibStub("AceConfig-3.0"):RegisterOptionsTable("Skyriding UI Full", OptionsTable)
